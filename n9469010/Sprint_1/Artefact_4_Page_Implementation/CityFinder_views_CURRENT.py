from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader, Context, Template
from django.template.loader import render_to_string
from .models import Cities, Data, Users

def submitCity(request, city_id):
	city = get_object_or_404(Cities, pk=city_id);
	try:
		submission = city.choice_set.get(pk=request.POST['choice'])
	except (KeyError, Cities.DoesNotExist):
		#redisplay form
		return render(request, 'CityFinder/createCity.html',
			      {'city':city, 'error_message':"Invalid submission!"});
	else:
		submission.cities+=1;
		submission.save();

def header(request, header_string):
	city_list = Cities.objects.order_by('-name')[:5];
	context = {"city_list":city_list};
	header = render_to_string("CityFinder/"+header_string, context);
	return header;

def index(request):
	data_list = Data.objects.order_by('-name')[:5];
	style = render_to_string("CityFinder/style.css");
	template = loader.get_template("CityFinder/index.html");
	context = {"data_list":data_list,"page_title":"City Finder", "insert_style":style,
                   "page_header":header(request, "header.html")};
	return HttpResponse(template.render(context, request));

def login(request):
	style = render_to_string("CityFinder/style.css");
	template = loader.get_template("CityFinder/login.html");
	context = {"page_title":"Login - City Finder", "insert_style":style, "page_header":header(request, "header.html")};
	return HttpResponse(template.render(context, request));

def register(request):
	style = render_to_string("CityFinder/style.css");
	template = loader.get_template("CityFinder/register.html");
	context = {"page_title":"Register - City Finder", "insert_style":style, "page_header":header(request, "header.html")};
	return HttpResponse(template.render(context, request));

def adminRegister(request):
	style = render_to_string("CityFinder/adminStyle.css");
	template = loader.get_template("CityFinder/adminRegister.html");
	context = {"page_title":"Admin Register - City Finder", "insert_style":style, "page_header":header(request, "adminHeader.html")};
	return HttpResponse(template.render(context, request));

def createCity(request):
	city_list = Cities.objects.order_by('-name')[:5];
	style = render_to_string("CityFinder/adminStyle.css");
	template = loader.get_template("CityFinder/createCity.html");
	context = {"city_list": city_list, "page_title":"Create City - City Finder", "insert_style":style, "page_header":header(request, "adminHeader.html")};
	return HttpResponse(template.render(context, request));

def createData(request):
	style = render_to_string("CityFinder/adminStyle.css");
	template = loader.get_template("CityFinder/createData.html");
	context = {"page_title":"Create Data - City Finder", "insert_style":style, "page_header":header(request, "adminHeader.html")};
	return HttpResponse(template.render(context, request));

def modifyData(request):
	style = render_to_string("CityFinder/adminStyle.css");
	template = loader.get_template("CityFinder/modifyData.html");
	context = {"page_title":"Modify Data - City Finder", "insert_style":style, "page_header":header(request, "adminHeader.html")};
	return HttpResponse(template.render(context, request));



