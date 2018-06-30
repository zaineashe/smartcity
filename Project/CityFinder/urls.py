from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^index/$', views.index, name = 'index'),
	url(r'^login/$', views.login, name = 'login'),
	url(r'^logout/$', views.logout, name = 'logout'),
	url(r'^register/$', views.register, name = 'register'),
	url(r'^adminRegister/$', views.adminRegister, name = 'adminRegister'),
	url(r'^accountEditing/$', views.accountEditing, name = 'accountEditing'),
	url(r'^Item/$', views.item, name = 'item'),
	#url(r'^createUser/$', views.registerHandler, name = 'createUser'),
		
	#url(r'^adminRegister/$', views.adminRegister, name = 'adminRegister'),
	#url(r'^createCity/$', views.createCity, name = 'createCity'),
	#url(r'^createData/$', views.createData, name = 'createData'),
	#url(r'^modifyData/$', views.modifyData, name = 'modifyData'),
	#url(r'^submitCity/$', views.submitCity, name = 'submitCity')
];
