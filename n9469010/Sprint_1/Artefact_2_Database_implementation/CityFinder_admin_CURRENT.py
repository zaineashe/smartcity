from django.contrib import admin

from .models import Cities, Data, Departments, Users

# Register your models here.

admin.site.register(Cities);
admin.site.register(Data);
admin.site.register(Departments);
admin.site.register(Users);
