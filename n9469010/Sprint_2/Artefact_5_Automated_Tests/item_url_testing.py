#import neccessary selenium drivers
#as well as sys, to run prints without linebreaks
import sys
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.support.ui import WebDriverWait

#open automated browser with chrome drive
browser = webdriver.Chrome()

#set max id tested, 500 for this test case
max_id = 500;

#opening logs
print("Item ID Testing - Checking GET id's from 0 to " + str(max_id))
print('Testing null ID')

# Test no id in URL
browser.get('http://localhost:8000/CityFinder/Item/')
WebDriverWait(browser, 6)

##check if the loaded page is still part of the cityfinder subsidiary, and not a django error		
assert (browser.title == 'City Finder')
##log assertion if it hasnt thrown an error
print('Null ID is valid, starting enumerated tests:')


# Test each id from 0 to max_id in URL
for i in range(0,max_id + 1):

	#start by printing current test id (i)
	print(str(i)+':', end='', flush=True)

	#load Item page, using i as the id value
	browser.get('http://localhost:8000/CityFinder/Item/?id='+str(i))
	WebDriverWait(browser, 5)

	#set a new output string to manipulate
	output = "";
	try:
		#try to grab the contents of itemHeader and assign it to output var
		output = browser.find_element_by_id('itemHeader').get_attribute("innerHTML");
	except:
		#if this doesnt work, no data has been loaded (id doesnt associate with any data)
		#log empty in this case
		output = "empty";

	##check if the loaded page is still part of the cityfinder subsidiary, and not a django error	
	assert (browser.title == 'City Finder')
	##log assertion if it hasnt thrown an error
	print(str(output) + ', ', end='', flush=True)
	##if 5 tests have printed on one line, print a line break
	if (i % 5 == 0 and i!=0):
		print('');

#final logs
#if these logs print, all asserts have passed (successful test)
print('')	
print('All tests passed')
