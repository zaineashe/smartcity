// ----------------  google map api interaction ----------------  

//initialise map
function initMap() {

    //initialise map zoom at value 12 (zoomed out enough to cover half of a city)
    var zoomValue = 12;
    //check if url is currently item page
    if (document.location.href.search("/Item/") != -1) {
        //if item page, set zoom value to 18 (about street level)
        zoomValue = 18;
    } //endif

    //collect centre position for map from data parsed from django
    //split data by it's comma and add resulting two values into array called cityPos
    //cityPos is also the id name of the html element that contains this data
    var cityPos = document.getElementById('cityPos').innerHTML.split(',');
    cityPos[0] = parseFloat(cityPos[0]);
    cityPos[1] = parseFloat(cityPos[1]);

    //set up a new map using google maps api
    map = new google.maps.Map(document.getElementById('map'), {

        //set centre to gathered lat and long values from cityPos
        center: { lat: cityPos[0], lng: cityPos[1] },

        //set zoom value to zoom determined by current URL
        zoom: zoomValue

        
    });
    
    //initialise map markers, set results to return of ShowMapMarkers method
    markers = showMapMarkers();

    //check if there are any markers at all
    if (markers.length > 0) {
        // set map center to the postion of the first result
        map.center = markers[0].position;
    } //endif

} //end initMap

//function to initialise map markers, and pull locations from django-parsed html data
function showMapMarkers() {

    //initialise map markers (for visuals), and datasets (to parse through lat and lon data) 
    var markers = [];
    var datasets = document.getElementsByTagName('data');

    for (var i = 0; i < datasets.length; i++) {

        //split each data tag into the four seperate pieces of information that provide
        // 0 - lat
        // 1 - lon
        var id = datasets[i].getAttribute('id');
        var data = datasets[i].getAttribute('value').split(',');
           

        //long at lat data
        var pos = {
            lat: parseFloat(data[0]),
            lng: parseFloat(data[1])
        };

        //set up new map marker with custom pos, and a unique item_id value for onlick processing
        var marker = new google.maps.Marker({
            position: pos,
            map: map,
            item_id: id,
            title:data[2]
        });

        //add a listener to the new marker that sends user to markers corresponding Item page
        //this is where item_id comes in. Because each map marker has their data id stored within memory,
        //the onclick event can reference it independently of var i or var id
        marker.addListener('click', function () {
            toItem(this.item_id.toString());
        });
        
        //add new marker to the markers array
        markers[i] = marker;

    } //end for

    //if index and not item
    if (document.location.href.search("/index/") != -1) {
        //handle list header to display search results
        initListHeader(datasets.length);
    } //endif

    //set up header filter types (based on user type)
    headerDataTypes();

    //return all the created markers
    return markers;

} // end showMapMarkers


//method to assign current GET URL search value to the header search bar
//called by initListHeader (on index page) and onload event for Item page
function fillSearchBar() {

    document.getElementById("searchBar").value = getFromURL("search=");

} // end fillSearchBar

//general purpose setup method for /index/ page used to fill in page title and search bar
function initListHeader(length) {

    //set up data types and assocs
    var dataTypes = ["", "College", "Library", "Industry", "Hotel", "Park", "Zoo", "Museum", "Mall", "Restaurant"];
    var dataAssocs = ["", "Co", "Li", "In", "Ho", "Pa", "Zo", "Mu", "Ma", "Re"];

    //check URL currently
    var iURL = window.location.href;

    //if no values in URL, set to default
    if (iURL.search("\\?") == -1) {
        window.location.href = iURL + "?city=&dataType=&cityID=&orderBy=d.data_name&search=";
    } //endif

    //set header to display current datatype and city
    var contentHead = document.getElementById("contentHeader")

    //This innerHTML set controls the header on index page that says eg. 'Melbourne - 5 restaurants found'
    //the code uses getFromURL to retrieve GET data and place it into a customized string, then sets that string to contenthead's innerHTML
    contentHead.innerHTML =
        getFromURL("city=") + " - '" +getFromURL("search=")+ "': " + length + " " + dataTypes[dataAssocs.indexOf(getFromURL("dataType="))] + " entries found";

    //call the fillSearchBar method to 
    fillSearchBar();

} // end initListHeader

//method that builds the header links to data preferences.
//takes user type, and filters header tabs based on that user's preference
// ie, businessman sees industry links over college links, etc. according to specification
function headerDataTypes() {

    //set up data types and their assocs
    var dataTypes = ["", "College", "Library", "Industry", "Hotel", "Park", "Zoo", "Museum", "Mall", "Restaurant"];
    var dataAssocs = ["", "Co", "Li", "In", "Ho", "Pa", "Zo", "Mu", "Ma", "Re"];

    //set up different kinds of user types
    //NULL - not logged in
    //B - Businessman
    //S - Student
    //T - Tourist
    //A - Admin

    var userTypes = ["NULL", "B", "S", "T", "A"];

    //user preferences array, first section is what a user prefers
    //second section is what goes in the 'other' dropdown box

    // -- userPrefs[type][0] = array of topics user IS interested in
    // -- userPrefs[type][1] = array of topics user IS NOT interested in
    var userPrefs = [ [[""],        ["Co", "Li", "In", "Ho"]],
                      [["Ho", "In"],  ["Co", "Li"]],
                      [["Co", "Li"],  ["In", "Ho"]],
                      [["Ho"], ["Co", "Li", "In"]],
                      [["Co", "Li", "In", "Ho"], [""]]
    ];

    

    //figure out current user type, by parsing through header data (identified by sortHeader id)
    var userType = userTypes.indexOf(document.getElementById('sortHeader').innerHTML);

    //begin the final links output. start by initialising first half of list
    var output = "<ul>";

    var n = 0;

    //add 'all' tab
    output += '<li><a id ="headTab_'+n+'" onclick="changeDataType(' + "''" + ');">All</a></li>';

    n += 1;
    //add user specific tabs (based on userprefs array)
    //uses userprefs[0] because 
    for (var i = 0; i < userPrefs[userType][0].length; i += 1) {
        //for each loop in user preferences, check if preference is null
        if (userPrefs[userType][0][i] != "") {
            // if not null, then add a link to this preference to the list
            output += '<li><a id ="headTab_' + n + '" onclick="changeDataType(' + "'" + userPrefs[userType][0][i] + "'" + ');">'
                    + dataTypes[dataAssocs.indexOf(userPrefs[userType][0][i])] + '</a></li>';
            n += 1;
        }//endif
    }//endfor

    //add city data tabs (every user can see these)
    //these links are constant throughout all user types (including logged out & admin)
    //therefore, static loop between i=5 and i=length (amount of preferences in list)
    //this could be better upscaled by using a seperate array for 'city data'
    for (var i = 5; i < dataAssocs.length; i += 1) {
        //output link to preference user IS interested in
        output += '<li><a id ="headTab_' + n + '" onclick="changeDataType(' + "'" + dataAssocs[i] + "'" + ');">' + dataTypes[i] + '</a></li>';
        n += 1;
    }//endfor

        //add user specific 'other' drop down box
        //functions similarly to city dropdown in header.html, but links to changeDataType method as opposed to changeCity method
        output += '<select id="navigationBarSelector" onchange="changeDataType(this.value)">';
        output += '<option> Other </option>'

        //run through 'other user preferences' (indexed as userPrefs[type][1])
        //process similar to preference loopthrough, but this one uses <option> tags with values instead of <a> tags with onclick events
        userPrefs[userType][1].length
        for (var i = 0; i < userPrefs[userType][1].length; i += 1) {
            //output option for preference user IS NOT interested in
            output += '<option id ="headTab_' + n + '" value = "' + userPrefs[userType][1][i] + '"> ' + dataTypes[dataAssocs.indexOf(userPrefs[userType][1][i])] + ' </option>';
            n += 1;
        }//endfor

        //finalise output by adding end tags to select and list
        output += '</select>'
 
    output += "</ul>";

    //set navigation bars innerhtml to final compiled output
    document.getElementById('navigationBar').innerHTML = output;

} // end headerDataTypes

//  ----------------  Header URL Manipulation  ---------------- 

// DISCLAIMER - Header URL manipulation could have very easily been scaled down to one dynamic
// DISCLAIMER - function, but due to time constraints, this more straightforward solution was applied

//method to replace datatype value from within the current URL
//datatype is replaced with element, a string argument parsed through by onclick events in header links
function changeDataType(element) {

    //initialise current url, and a substitute string to manipulate
    //newURL also contains the current URL address
    var URL = document.location.href;
    var newURL = URL;

    //check if the page is currently not index
    if (document.location.href.search("/index/") == -1) {

        //this means page is Item right now
        //replace item with index, to redirect to index page
        //this could easily be done with a document.location.href reassignment
        //but this replace is done so that GET values arent lost when transitioning from item page
        //back to index page. This is done to make UX more smooth
        newURL = newURL.replace('/Item/', '/index/');

    } //endif

    //use a regex to replace current datatype GET value with parsed element string
    //this replace 'switches' out current datatype in the newURL string
    newURL = newURL.replace(/dataType=[a-z]*/i, "dataType=" + element);
    //also use regex to empty out the search GET
    newURL = newURL.replace(/search=[1-9]*/i, "search=");

    //change document location to the newly manipulated URL
    document.location.href = newURL;

}// end changeDataType

//method to replace orderby GET value with 'element' argument, parsed through as string
function changeOrderBy(element) {

    //set current URL
    var URL = document.location.href;

    //switch out orderby with parsed element string, using regex replacement
    var newURL = URL.replace(/orderBy=.*&/i, "orderBy=" + element + "&");

    //assign new document location
    document.location.href = newURL;

} // end changeOrderBy

//method to replace city and cityID GET values with a split version 'element' argument, which is parsed through as string
function changeCity(element) {

    //city data is split into ID and city name
    //split is denoted by a decimal char
    //split data is stored within an array called data
    var data = element.split('.');

    //set URL to current document location, and initialise newURL to be manipulated
    var URL = document.location.href;
    var newURL = URL;

    //check if page is currently not index
    if (document.location.href.search("/index/") == -1) {
        //if not index, assume page is item
        //switch out item in URL to index
        newURL = newURL.replace('/Item/', '/index/');
    } //endif

    //replace city GET value with corresponding city name within data array, using regex replace
    newURL = newURL.replace(/city=[a-z]*/i, "city=" + data[1]);
    //replace cityID with corresponding city id in data array, using regex replace
    newURL = newURL.replace(/cityID=[1-9]*/i, "cityID=" + data[0]);
    //empty search GET, using regex replace
    newURL = newURL.replace(/search=[1-9]*/i, "search=");

    //set document location to newly manipulated newURL
    document.location.href = newURL;

}//end changeCity

//function to replace search GET value with the innerHTML value present within the header's searchbar
function changeSearch() {

    //first, find the searchbar in header HTML, identified by 'searchBar' id
    var element = document.getElementById("searchBar").value;

    //set up URL to current document location, and intialise newURL for manipulation
    var URL = document.location.href;
    var newURL = URL;

    //check if not index
    if (document.location.href.search("/index/") == -1) {
        //if not index, assume item page
        //replace item with index in URL
        newURL = newURL.replace('/Item/', '/index/');
    }//endif

    //replace search GET value with current innerHTML of searchbar tag
    newURL = newURL.replace(/search=[a-z]*/i, "search=" + element);

    //set document location to this newURL
    document.location.href = newURL;

}//end changeSearch

//method to redirect to Item page
//this method is used instead of standard href links
//this is in order to preserve current GET data (which are essentially search filters)
//across the transition between pages
function toItem(id) {
    document.location.href = "/CityFinder/Item/?id=" + id + "&city=" + getFromURL('city=') + "&dataType=" + getFromURL('dataType=') + "&cityID="
                           + getFromURL('cityID=') + "&orderBy=" + getFromURL('orderBy=') + "&search=" + getFromURL('search=') + "";
    
}


// ----------------  URL Manipulation  ----------------  

//method to retrieve GET values from URL using string manipulation
//string argument getName determines which value is being retrieved (by mimicking its style in the URL)
// example: getFromURL('search=') will return current search GET value
function getFromURL(getName) {

    //set iURL to current document location, and intialize newout var to be manipulated
    var iURL = window.location.href;
    var newout = "";

    //check if name even exists within url
    //if else, ignore all GET processing, and return the null string
    if (iURL.indexOf(getName) != -1) {
        //using getName argument, slice of unnecessary parts of url
        //url will now start at the value, and end at original URL endpoint
        newout = iURL.substring(iURL.indexOf(getName) + getName.length, iURL.length);

        //check if the new string contains an & symbol in it, meaning more that one value
        //is stored in it.
        if (newout.search("&") != -1) {
            //if yes, cut out the closest & symbol and any chars following it
            newout = newout.substring(0, newout.indexOf("&"));
        
        }//endif
    }//endif

    //final result is the desired value, cut out of the URL
    //return this final newout
    return newout;
    
} // end getFromURL

// -------- User login and register handling ----------

// Validates the register form
//parses form data as argument
function registerSubmit(form) {

    //ensure each input is valid, storing results in 
    //a respective boolean var
    //parse form argument through for each of these checks
    //check name
    var name = checkName(form);
    //check username
    var username = checkUsername(form);
    //check user password
    var password = checkPassword(form);
    //check usertype
    var userType = checkUserType(form);
    //check email
    var email = checkEmail(form);
    //check address
    var address = checkAddress(form);
    //check phone number
	var phoneNumber = checkPhoneNumber(form);
    
    //if all inputs come up valid, return true 
    //if else return false
	return (name && username && email && password && phoneNumber && address && userType);

} // end registerSubmit

// Validates the register form
//parses form data as argument
function loginSubmit(form) {

    //validate username and password, by running their respective check methods
    //check username, parse through form data
    var username = checkUsername(form);
    //check password, parse through form data
    var password = checkPassword(form);
    
    //if both inputs are valid, return true
    return (username && password);

} // end loginSubmit

// Checks if the name fields are empty and returns false if so
//parses form data as argument
function checkName(form) {

    //check if firstname and lastname exists within the form
    if (form.firstName.value == "" || form.lastName.value == "") {

        //if either inputs aren't present, set the noName error tag to display
        document.getElementById("noName").style.display = 'inline-block';
        //and return false, name has not validated
        return false;

    } else {

        //if both first and last name have values, return true
        //name has been validated
        return true;

    }//endif

} // end checkName

// Checks if the username fields are empty and returns false if so
//parses form data as argument
function checkUsername(form) {

    //check if the username input exists within current form, and is not a null string
    if (form.username.value == "") {

        //if username is not in form, throw the noUsername error
        document.getElementById("noUsername").style.display = 'inline-block';
        //and return false, username has not validated
        return false;

    } else {
        
        //if username exists within given form, return true
        //username is validated
        return true;

    }//endif

} // end checkUsername

// Checks if the email field is empty or invalid and returns false if so.
//parses form data as argument
function checkEmail(form) {

    // Pattern matches the style that is entered into the database
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    
    //check if email exists within the form, and is not a null string
    //also check if email's string value fits the emailPattern regex test
    if (form.email.value != "" && !emailPattern.test(form.email.value)) {

        //if these requirements arent met, throw error by displaying noEmail tag
        document.getElementById("noEmail").style.display = 'inline-block';
        //and return false, email is not validated
        return false;

    } else {

        //if email exists in form, isnt null string, and fits the emailPattern, return true
        //email has been validated
        return true;

    }//endif

} // end checkEmail

// Checks if the phone number field is invalid and returns false if so.
//parses form data as argument
function checkPhoneNumber(form) {

    // Pattern matches the style that is entered into the database
    var phoneNumberPattern = /^[0-9]{10}$/;

    //check if phonenumber exists, is not a null string, and fits the phoneNumberPattern regex test
    if (form.phoneNumber.value != "" && !phoneNumberPattern.test(form.phoneNumber.value)) {

        //if these requirements are not met, throw an error, displaying the noPhoneNumber html tag
        document.getElementById("noPhoneNumber").style.display = 'inline-block';
        //and return false, phoneNo has not been validated
        return false;

    } else {

        //if conditions have been met, return true
        //phoneNo has been validated
        return true;

    }//endif

} // end checkPhoneNumber

// Checks if the user type isn't selected and returns false if so.
//parses form data as argument
function checkUserType(form) {

    // Pattern matches the style that is entered into the database
    if(form.userType.value == "") {
        document.getElementById("noUserType").style.display = 'inline-block';
        return false;
    } else {
        return true;
    }//endif

} // end checkUserType

// Checks if the password field is empty and returns false if so
//parses form data as argument
function checkPassword(form) {

    //check if password value exists within the form, and is not a null string
    if (form.password.value == "") {

        //if requirements arent met, throw error by displaying the noPassword html tag
        document.getElementById("noPassword").style.display = 'inline-block';
        //and return false, password has not been validated
        return false;

    } else {

        //if requirement are met, return true
        //password is validated
        return true;

    }//endif

} // end checkPassword

// Clears the error message
// parses through id of HTML tag that is being cleared
function clearError(id) {

    //get element of message (identified by id argument) and clear display style
    document.getElementById(id).style.display = 'none';

} //end clearError

//Checks address
//parses form data as argument
function checkAddress(form) {

    //check if address exists within the parsed form, and is not a null string
    if (form.address.value != "") {
        //if requirements have been met, attempt to split the address value
        //split by the comma char (,)
        address = form.address.value.split(',');

        //check if address was successfully split into 5 components
        if (address.length != 5) {
            
            //if address fails these requirements, throw error by displaying noAddress html tag
            document.getElementById("noAddress").style.display = 'inline-block';
            //and return false, address is not valid
            return false;

		}//endif
	}//endif
	
    //if address doesnt get trapped within the split validation (i.e. successfully splits into 5 values)
    //return true, address is valid
	return true;

} // end checkAddress
