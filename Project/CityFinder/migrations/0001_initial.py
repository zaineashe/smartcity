# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-25 08:49
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('address_id', models.AutoField(max_length=500, primary_key=True, serialize=False)),
                ('street_number', models.IntegerField(null=True)),
                ('street_name', models.CharField(max_length=200, null=True)),
                ('suburb', models.CharField(max_length=200, null=True)),
                ('postcode', models.IntegerField(null=True)),
                ('city', models.CharField(max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Cities',
            fields=[
                ('city_id', models.AutoField(primary_key=True, serialize=False)),
                ('city_name', models.CharField(max_length=200)),
                ('latitude', models.DecimalField(decimal_places=14, max_digits=18, null=True)),
                ('longitude', models.DecimalField(decimal_places=14, max_digits=18, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Data',
            fields=[
                ('data_id', models.AutoField(max_length=500, primary_key=True, serialize=False)),
                ('dataType', models.CharField(choices=[('Co', 'College'), ('Li', 'Library'), ('In', 'Industry'), ('Ho', 'Hotel'), ('Pa', 'Park'), ('Zo', 'Zoo'), ('Mu', 'Museum'), ('Ma', 'Mall'), ('Re', 'Restaurant')], max_length=200)),
                ('industryType', models.CharField(max_length=200, null=True)),
                ('data_name', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=200, null=True)),
                ('email', models.CharField(max_length=200, null=True)),
                ('city_id', models.IntegerField(null=True)),
                ('latitude', models.DecimalField(decimal_places=14, max_digits=18, null=True)),
                ('longitude', models.DecimalField(decimal_places=14, max_digits=18, null=True)),
                ('address', models.ForeignKey(max_length=500, null=True, on_delete=django.db.models.deletion.CASCADE, to='CityFinder.Address')),
            ],
        ),
        migrations.CreateModel(
            name='Departments',
            fields=[
                ('department_id', models.AutoField(max_length=500, primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=200)),
                ('college', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CityFinder.Data')),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('user_id', models.AutoField(max_length=500, primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=200, unique=True)),
                ('email', models.CharField(max_length=200, null=True)),
                ('password', models.CharField(max_length=200)),
                ('salt', models.CharField(default='salt', max_length=200)),
                ('userType', models.CharField(choices=[('B', 'Business'), ('S', 'Student'), ('T', 'Tourist'), ('A', 'Admin')], max_length=200)),
                ('firstName', models.CharField(max_length=200)),
                ('lastName', models.CharField(max_length=200)),
                ('phoneNumber', models.CharField(max_length=200, null=True)),
                ('address', models.ForeignKey(max_length=500, null=True, on_delete=django.db.models.deletion.CASCADE, to='CityFinder.Address')),
            ],
        ),
    ]