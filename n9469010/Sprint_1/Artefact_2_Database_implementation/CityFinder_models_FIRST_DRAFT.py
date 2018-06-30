from django.db import models

# Create your models here.


class Cities(models.Model):
    city_id = models.IntegerField(primary_key = True);
    name = models.CharField(max_length=200);
    
class Data(models.Model):
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
    data_id = models.IntegerField(primary_key = True);
    city = models.ForeignKey('Cities', on_delete=models.CASCADE);
    dataType = models.CharField(max_length=200, choices=DATA_TYPES);
    industryType = models.CharField(max_length=200, null=True);
    collegeID = models.IntegerField(null=True);
    name= models.CharField(max_length=200);
    address = models.CharField(max_length=200, null=True);
    phone = models.CharField(max_length=200, null=True);
    email = models.CharField(max_length=200, null=True);

class Departments(models.Model):
    department_id = models.IntegerField(primary_key = True);
    college = models.ForeignKey('Data', on_delete=models.CASCADE);
    name = models.CharField(max_length=200);

class Users(models.Model):
    USER_TYPES = (
        ('B','Business'),
        ('S','Student'),
        ('T','Tourist'),
        ('A','Admin'),
    );
    user_id = models.IntegerField(primary_key = True);
    username= models.CharField(max_length=200);
    email= models.CharField(max_length=200);
    password= models.CharField(max_length=200);
    userType= models.CharField(max_length=200, choices = USER_TYPES);
    firstname= models.CharField(max_length=200);
    lastname= models.CharField(max_length=200);
    DOB= models.DateField();
