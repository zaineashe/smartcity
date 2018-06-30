from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template import loader, Context, Template
from django.template.loader import render_to_string
from .models import Cities, Data, Users, Departments, Address
import hashlib, uuid

#header class used in every page of the CityFinder frontend
def header(request, header_string):
	#grab a list of cities, ordered by city name
	#this is for the drop down 'select your city' box
	#store in city_list var
	city_list = Cities.objects.order_by('-city_name');

	#try and grab lat and long values from current city via URL GET
	#store in city var
	try:
		
		city = Cities.objects.get(city_id = request.GET["cityID"]);
	except:
		#if GET fails, set city var to null string
		city = "";
	
	try:
		#try to grab current user through the HTTPS requests sessionid
		user = Users.objects.get(username = request.session['username'])
		#if there is a user logged in, create a context containing username and userType
		#context also contains default city_list and current city data (parsed to template as cur_city)
		context = {     "city_list":city_list,
				"cur_city":city,
				"username": request.session['username'],
				"userType":user.userType
		};
	except:
		#if an error raises, then just create default context
		#(which is city_list, and city as cur_city)
		context = {"city_list":city_list,
			   "cur_city":city
		};

	#render the header template using the provided context
	header = render_to_string("CityFinder/"+header_string, context);

	#return the final render
	return header;

def item(request):
	#load the template itself, item.html
	template = loader.get_template("CityFinder/item.html");
	try:
		#grab individual data object, using GET id value from URL as filter
		data = Data.objects.get(data_id = request.GET['id']);
		#grab the address associated with that individual data's address_id
		address = Address.objects.get(address_id = data.address_id);

		#grab city data associated with that data's city_id
		city = Cities.objects.get(city_id = data.city_id);
	
		#check if data is college
		#get departments related
		if data.dataType=="Co":
			#grab all departments associated with the college's data_id
			departments = Departments.objects.filter(college=data.data_id);
		else:
			#if otherwise, return departments as a null string
			departments="";

		#assemble the context, to allow the template to fill itself out
		#context includes the data item, its address and its city.
		#page title is also included, and the header is called using the prior header class
		#Departments is also parsed into the context, whether or not it is a null string
		context = {"data":data,"address":address, "city":city, "page_title":"City Finder",
			   "page_header":header(request, "header.html"), "departments":departments};
	except:
		data = "";
		context = {"page_title":"City Finder",
			   "page_header":header(request, "header.html")};


	

	#render final page and return
	return HttpResponse(template.render(context, request));

def index(request):

	#retrieve GET values from page URL
	#GET values are generated by user input, and used to filter the database search
	
	#dataType
	query_dataType = "";
	try:
		query_dataType = request.GET['dataType'];
	except:
		query_dataType="";
		
	#cityID
	query_city = "";
	try:
		query_city = request.GET['cityID'];
	except:
		query_city="";
		
	#orderBy
	query_order = "";
	try:
		query_order = request.GET['orderBy'];
	except:
		query_order="";
		
	#search
	query_search = "";
	try:
		query_search = request.GET['search'];
	except:
		query_search="";
		
	#start to assemble the final query
	final_query = "SELECT * ";
	#add universal settings
	#query grabs data from cityfinder_data table, and from the cityfinder_address table.
	#the two tables are inner joined, using the address_id of both tables to link tables properly
	final_query += "FROM cityfinder_data AS d INNER JOIN cityfinder_address AS a ON d.address_id = a.address_id WHERE 1=1";

	#if query_city isnt a null string, add its associated a clause to the final string
	if query_city != "":
		final_query+=" AND d.city_id = " + query_city;

	#if query_dataType isnt a null string, add its associated a clause to the final string
	if query_dataType != "":
		final_query+=" AND d.dataType = '" + query_dataType + "'";

	#if query_search isnt a null string, add its associated a clause to the final string
	#this extra clause uses the LIKE statement, for search functionality (not a strict comparison of strings)
	if query_search != "":
		final_query+=" AND d.data_name LIKE '%%" + query_search + "%%'";

	#if query_order isnt a null string, add its associated a parameter to the final string
	#this clause is an ORDER BY, using the associated data as a column header, instead of a string comparitor
	if query_order!= "":
		final_query+=" ORDER BY " + query_order + " ASC;"

	#run raw SQL query to retrieve data, using GET values as filters
	data_list = Data.objects.raw(final_query);

	#initialise lcount as 1
	#lcount is tested on the template layer to prevent page errors from occuring
	#if lcount is caught in an error, then it reverts to 0, making the data not load
	lcount = 1;

	try:
		#check if the data returned by final_query can actually
		#be split with a for loop
		#(this is what the template does to list data)
		#(if this test passes, then data can be displayed in template)
		for data in data_list:
			#set lcount to a value greater than 0, so that the data
			#displays itself within the template
			lcount+=1;
	except:
		#if test fails, revert lcount to 0, preventing data from
		#displaying on front end
		lcount = 0;

	
	try:
		orderBy = request.GET['orderBy']
	except:
		orderBy = ''

	#load the template itself, result.html
	template = loader.get_template("CityFinder/result.html");

	#assemble the context, to allow the template to fill itself out
	#parse through data list, page title and lcount
	#also render and parse through header, using prior header class
	#context also sends through orderBy and final query data for debugging purposes
	context = {"data_list":data_list,"page_title":"City Finder", "orderBy": orderBy,
		   "page_header":header(request, "header.html"), "final_query":final_query, "lcount":lcount};

	#render final page and return
	return HttpResponse(template.render(context, request));

# logout controller
def logout(request):
	try:
		del request.session['username']
	except KeyError:
		pass
		
	return redirect('/CityFinder/index/')
	
# login controller	
def login(request):
	if ('username' in request.POST):
		# users have pressed submit button
		try:
			loginHandler(request)
		except:
			return loginView(request, 1)
		
		userType = Users.objects.get(username = request.POST['username']).userType
		
		# log in as admin
		if userType == 'A':
			from django.contrib import admin
			from django.contrib.auth import authenticate, login
			
			username = request.POST['username']
			password = request.POST['password']
			user = authenticate(request, username=username, password=password)
			
			if user is not None:
				login(request, user)
				admin.AdminSite().login(request)
				return redirect('/admin/')
			else:
				return loginView(request, 1)
		else:
			return redirect('/CityFinder/index/')
		
	else:
		return loginView(request, 0)
		
# login logic
def loginHandler(request):
	username = request.POST['username']
	password = request.POST['password']
	
	user = Users.objects.get(username = username)
	
	hash = hashlib.sha256()
	hash.update(password.encode('utf8') + user.salt.encode('utf8'))
	
	# incurrect password
	if (hash.hexdigest() != user.password):
		raise
		
	request.session['username'] = username

def loginView(request, loginFailed):
	template = loader.get_template("CityFinder/login.html");
	context = {"page_title": "Login - City Finder",
			   "loginFailed": loginFailed,
			   "page_header":header(request, "header.html")};
	return HttpResponse(template.render(context, request));

# register controller
def register(request):
	if ('username' in request.POST):
		# users have pressed submit button
		try:
			registerHandler(request)
		except:
			return registerView(request, 1)
		
		return redirect('/CityFinder/login/')
	else:
		return registerView(request, 0)
	
def registerView(request, registerFailed):
	template = loader.get_template("CityFinder/register.html");
	context = {"page_title": "Register - City Finder", 
			   "registerFailed": registerFailed,
			   "page_header": header(request, "header.html")};
	return HttpResponse(template.render(context, request));
	
# register logic
def registerHandler(request):
	user = Users()
	
	user.firstName = request.POST['firstName']
	user.lastName = request.POST['lastName']
	user.username = request.POST['username']
	user.salt = uuid.uuid4().hex
	
	hash = hashlib.sha256()
	hash.update(request.POST['password'].encode('utf8') + user.salt.encode('utf8'))
	
	user.password = hash.hexdigest()
	user.userType = request.POST['userType']
	user.phoneNumber = request.POST['phoneNumber']
	user.email = request.POST['email']
	
	# users have provided address
	if request.POST['address'] != '':
		address = Address()
		userAddress = request.POST['address'].split(',')
		address.street_number = userAddress[0].strip()
		address.street_name = userAddress[1].strip()
		address.suburb = userAddress[2].strip()
		address.postcode = userAddress[3].strip()
		address.city = userAddress[4].strip()
		address.save()
		user.address = address
	else:
		user.address = None
	
	user.save()

# admin register controller
def adminRegister(request):
	if ('username' in request.POST):
		try:
			adminRegisterHandler(request)
		except:
			return adminRegisterView(request, 1)
		
		return redirect('/CityFinder/login')
	else:
		return adminRegisterView(request, 0)
		
def adminRegisterView(request, registerFailed):
	template = loader.get_template("CityFinder/adminRegister.html");
	context = {"page_title": "Admin Register - City Finder", 
			   "registerFailed": registerFailed,
			   "page_header": header(request, "header.html")};
	return HttpResponse(template.render(context, request));
	
def adminRegisterHandler(request):
	registerHandler(request)
	
	from django.contrib.auth import get_user_model
	
	UserModel = get_user_model()
	
	user_data = {}
	user_data[UserModel.USERNAME_FIELD] = request.POST['username']
	user_data['password'] = request.POST['password']
	user_data['email'] = request.POST['email']
	UserModel._default_manager.db_manager('default').create_superuser(**user_data)

def accountEditing(request):
	if ('username' in request.POST):
		try:
			accountEditingHandler(request)
			return accountEditingView(request, 0)
		except:
			return accountEditingView(request, 1)
	
	else:
		return accountEditingView(request, 2)
	
def accountEditingView(request, status):
	user = Users.objects.get(username = request.session['username'])
	
	try:
		address = Address.objects.get(address_id = user.address_id)
	except:
		address = None
	
	template = loader.get_template("CityFinder/accountEditing.html");
	context = {"page_title": "Account Editing - City Finder", 
			   "status": status,
			   "firstName": user.firstName,
			   "lastName": user.lastName,
			   "username": user.username,
			   "userType": user.userType,
			   "phoneNumber": user.phoneNumber,
			   "email": user.email,
			   "address": address,
			   "page_header": header(request, "header.html")};
	return HttpResponse(template.render(context, request));
	
def accountEditingHandler(request):
	
	user = Users.objects.get(username = request.session['username'])

	user.firstName = request.POST['firstName']
	user.lastName = request.POST['lastName']
	user.username = request.POST['username']
	user.salt = uuid.uuid4().hex
	
	hash = hashlib.sha256()
	hash.update(request.POST['password'].encode('utf8') + user.salt.encode('utf8'))
	
	user.password = hash.hexdigest()
	user.userType = request.POST['userType']
	user.phoneNumber = request.POST['phoneNumber']
	user.email = request.POST['email']
	
	try:
		address = Address.objects.get(address_id = user.address_id)
	except:
		address = Address()
		
	if request.POST['address'] != '':
		userAddress = request.POST['address'].split(',')
		address.street_number = userAddress[0].strip()
		address.street_name = userAddress[1].strip()
		address.suburb = userAddress[2].strip()
		address.postcode = userAddress[3].strip()
		address.city = userAddress[4].strip()
		address.save()
		user.address_id = address
	
	user.save()


