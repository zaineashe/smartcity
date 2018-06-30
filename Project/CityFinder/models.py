from django.db import models


##Cities class stores all the compatible cities that CityFinder can use
##for data and address association
class Cities(models.Model):
        #primary key city_id for identification
	city_id = models.AutoField(primary_key = True);
	
	#city name, char field
	city_name = models.CharField(max_length=200);
	
	#city latitude
	latitude = models.DecimalField(null=True, max_digits = 18, decimal_places = 14);

        #city longitude
	longitude = models.DecimalField(null=True, max_digits = 18, decimal_places = 14);

##Data is the main class for CityFinder's index
##hosts data for user perusal, covering all types viewable by all users
class Data(models.Model):
        #establish all the possible data types
        #1 - College, 2 - Library, 3 - Industry, 4 - Hotel
        #5 - Park, 6 - Zoo, 7 - Museum, 8 - Mall, 9 - Restaurant
	DATA_TYPES = (
		('Co','College'),
		('Li','Library'),
		('In','Industry'),
		('Ho','Hotel'),
		('Pa','Park'),
		('Zo','Zoo'),
		('Mu','Museum'),
		('Ma','Mall'),
		('Re','Restaurant'),
	);

	#primary key auto increment field for identification
	#data_id
	data_id = models.AutoField(primary_key = True, max_length=500);

	#datatype, choosable from the predefined DATA_TYPES
	#determine how data will be filtered by CityFinder's main headers
	dataType = models.CharField(max_length=200, choices=DATA_TYPES);

	#industryType, a charfield used mainly only for In - Industry type data
	#if the specification was to change for this project, industryType could
	#be renamed and repurposed to provide suppimentary information for any
	#kind of data type
	industryType = models.CharField(max_length=200, null=True);

	#Data name, used for searchbar filtering
	data_name= models.CharField(max_length=200);

	#address is a foreign key to the Address class, will cascade on delete
	address = models.ForeignKey('Address', on_delete=models.CASCADE, null = True, max_length = 500);

        #phone number
	phone = models.CharField(max_length=200, null=True);

	#email address
	email = models.CharField(max_length=200, null=True);

	#city_id, used to associate this data with it's city.
	#also used in city filtering
	city_id = models.IntegerField(null=True);
	
	#lat and lon value for map API
	#data latitude
	latitude = models.DecimalField(null=True, max_digits = 18, decimal_places = 14);
        #data longitude
	longitude = models.DecimalField(null=True, max_digits = 18, decimal_places = 14);
	
#Departments class to be used for college type data
#For changed specifications & scalability, departments has
#the technical potential to be used by any type of data
#(e.g. stores at a mall, exhibits at a museum, etc.)
class Departments(models.Model):
        #primary key used for identification
	department_id = models.AutoField(primary_key = True, max_length=500);

        #college foreign key, used to associate each individual
        #department to its college. This can be renamed to suit any
	#type of data
	college = models.ForeignKey('Data', on_delete=models.CASCADE);

	#department name charfield
	department_name = models.CharField(max_length=200);

#address, shared by users and data entries
#contains address info to be displayed on CityFinder front-end
class Address(models.Model):
        #primary key for identifying addresses
	address_id = models.AutoField(primary_key = True, max_length=500);
	
	#street number integer field
	street_number = models.IntegerField(null = True);
	
	#street name charfield
	street_name = models.CharField(max_length = 200, null = True);
	
	#suburb charfield
	suburb = models.CharField(max_length = 200, null=True);
	
	#postcode integerfield
	postcode = models.IntegerField(null=True);
	
	#city charfield
	#city remains a charfield here and not an integer field
	#because of a persistent error involving foreign key constraints
	#for now the Data class has its own city ID, as to avoid this bug
	city = models.CharField(max_length = 200, null=True);

#users class is used to handle login, registration
#and to filter data based on user preference
class Users(models.Model):
        #establish all possible user types
        #1 - Business, 2 - Student, 3 - Tourist, 4 - Admin
	USER_TYPES = (
		('B','Business'),
		('S','Student'),
		('T','Tourist'),
		('A','Admin'),
	);

	#user id primary key for identification
	user_id = models.AutoField(primary_key = True, max_length=500);

	#username charfield
	username= models.CharField(max_length=200, unique = True);

	#email charfield
	email= models.CharField(max_length=200, null = True);

	#password charfield (STORED AS A SHA256 HASH)
	password= models.CharField(max_length=200);

	#salt charfield - used to hash password inputs and validate
	salt = models.CharField(max_length=200, default='salt');

	#usertype charfield, selectable only from the USER_TYPES selections
	userType= models.CharField(max_length=200, choices = USER_TYPES);

        #firstname charfield
	firstName= models.CharField(max_length=200);

	#lastname charfield
	lastName= models.CharField(max_length=200);

	#address foreign key, used to associate user with an address.
	address = models.ForeignKey('Address', on_delete=models.CASCADE, null = True, max_length = 500);

        #phone number charfield
	phoneNumber = models.CharField(max_length=200, null = True);
