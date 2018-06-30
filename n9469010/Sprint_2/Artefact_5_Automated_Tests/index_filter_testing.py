# AUTOMATED TEST BUILT TO CATCH DJANGO ERRORS

#import sys library
import sys

#import necessary selenium libraries
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.support.ui import WebDriverWait

#open browser using chrome drive
browser = webdriver.Chrome()

#set upper bounds for dataType, city and orderBy
max_dataType = 9;
max_city = 6;
max_orderBy = 1;

#establish alphabet string for search engine testing
alphabet = "abcdefghijklmnopqrstuvwxyz";

##print intro log
print("Index testing - Test every filter")

##first test opens cityfinder index without any filters
print(' --- Testing no filters ---')

# Test no id in URL
browser.get('http://localhost:8000/CityFinder/index/')
WebDriverWait(browser, 6)

#check if browser is still at a cityfinder site (not django error)
assert (browser.title == 'City Finder')
print('Null filter is valid')

##start testing filters
##test each filter individually, without stacking any filters
print(' --- Testing individual filters ---')

#city loop
for i in range(1,max_city+1):
	#click current city option
	browser.find_element_by_id('city_'+str(i)).click();
	#wait for click to load new page
	WebDriverWait(browser, 6)
	#check if browser is still at a cityfinder site (not django error)
	assert (browser.title == 'City Finder');
	#if code isnt killed by asset, print current city as valid
	print("City: ", end="", flush=True);
	#print current city
	print(browser.find_element_by_id('city_'+str(i)).get_attribute("innerHTML") + ' X');

##PRINT A REFRESH
print("Refreshing ...");
#click logo
browser.find_element_by_id('logo').click();
#WAIT FOR PAGE TO REFRESH
WebDriverWait(browser, 6)

#dataType loop
for n in range(0,max_dataType+1):
	#click current data type tab
	browser.find_element_by_id('headTab_'+str(n)).click();
	#wait for click to load new page
	WebDriverWait(browser, 6)
	#check if browser is still at a cityfinder site (not django error)
	assert (browser.title == 'City Finder');
	#if code isnt killed by asset, print current data type as valid
	print("Data Type:", end="", flush=True);
	#print current data type
	print(browser.find_element_by_id('headTab_'+str(n)).get_attribute("innerHTML") + ' X');

##PRINT A REFRESH
print("Refreshing ...");
#click logo
browser.find_element_by_id('logo').click();
#WAIT FOR PAGE TO REFRESH
WebDriverWait(browser, 6)

#orderBy loop
for x in range(0,max_orderBy+1):
	#click current orderBy option
	browser.find_element_by_id('orderBy_'+str(x)).click();
	#wait for click to load new page
	WebDriverWait(browser, 6)
	#check if browser is still at a cityfinder site (not django error)
	assert (browser.title == 'City Finder');
	#if code isnt killed by asset, print current order by as valid
	print("Order by:", end="", flush=True);
	#print current orderBy
	print(browser.find_element_by_id('orderBy_'+str(x)).get_attribute("innerHTML") + ' X');

##PRINT A REFRESH
print("Refreshing ...");
#click logo
browser.find_element_by_id('logo').click();
#WAIT FOR PAGE TO REFRESH
WebDriverWait(browser, 6)

#alphabet loop
for y in range(0,len(alphabet)):
	#input given letter into the search bar, and click enter
	browser.find_element_by_id('searchBar').clear();
	browser.find_element_by_id('searchBar').send_keys(alphabet[y]);
	browser.find_element_by_id('searchBar').send_keys(Keys.RETURN);
	#wait for submission to load new page	
	WebDriverWait(browser, 6)
	#check if browser is still at a cityfinder site (not django error)
	assert (browser.title == 'City Finder');
	#if code isnt killed by asset, print current search as valid
	#print current character
	print(alphabet[y] + ' X,', end="", flush=True);
	#split alphabet with a new line every 13 letters
 	if (y!=0 and y % 13 == 0):
		print("");

##PRINT A REFRESH
print("Refreshing ...");
#click logo
browser.find_element_by_id('logo').click();
#WAIT FOR PAGE TO REFRESH
WebDriverWait(browser, 6)

print(' --- Testing nested filters ---')

#city loop
for i in range(1,max_city+1):
	#click current city option
	browser.find_element_by_id('city_'+str(i)).click();
	#wait for click to load new page
	WebDriverWait(browser, 6)
	#check if browser is still at a cityfinder site (not django error)
	assert (browser.title == 'City Finder');
	#if code isnt killed by asset, print current city as valid
	print("City: ", end="", flush=True);
	#print current city
	print(browser.find_element_by_id('city_'+str(i)).get_attribute("innerHTML") + ' X');

	#dataType loop
	for n in range(0,max_dataType+1):
		#click current data type tab
                browser.find_element_by_id('headTab_'+str(n)).click();
                #wait for click to load new page
                WebDriverWait(browser, 6)
                #check if browser is still at a cityfinder site (not django error)
                assert (browser.title == 'City Finder');
                #if code isnt killed by asset, print current data type as valid
                print("Data Type:", end="", flush=True);
                #print current data type
                print(browser.find_element_by_id('headTab_'+str(n)).get_attribute("innerHTML") + ' X');
		
		#orderBy loop
		for x in range(0,max_orderBy+1):
			#click current orderBy option
                        browser.find_element_by_id('orderBy_'+str(x)).click();
                        #wait for click to load new page
                        WebDriverWait(browser, 6)
                        #check if browser is still at a cityfinder site (not django error)
                        assert (browser.title == 'City Finder');
                        #if code isnt killed by asset, print current order by as valid
                        print("Order by:", end="", flush=True);
                        #print current orderBy
                        print(browser.find_element_by_id('orderBy_'+str(x)).get_attribute("innerHTML") + ' X');
			
			#alphabet loop
			for y in range(0,len(alphabet)):
				#input given letter into the search bar, and click enter
                                browser.find_element_by_id('searchBar').clear();
                                browser.find_element_by_id('searchBar').send_keys(alphabet[y]);
                                browser.find_element_by_id('searchBar').send_keys(Keys.RETURN);
                                #wait for submission to load new page	
                                WebDriverWait(browser, 6)
                                #check if browser is still at a cityfinder site (not django error)
                                assert (browser.title == 'City Finder');
                                #if code isnt killed by asset, print current search as valid
                                #print current character
                                print(alphabet[y] + ' X,', end="", flush=True);
                                #split alphabet with a new line every 13 letters
                                if (y!=0 and y % 13 == 0):
                                        print("");
				
			print("");
			
			
	##PRINT A REFRESH
        print("Refreshing ...");
        #click logo
        browser.find_element_by_id('logo').click();
        #WAIT FOR PAGE TO REFRESH
        WebDriverWait(browser, 6)

#if all test pass, print so and terminate program
print('')	
print('All tests passed')
