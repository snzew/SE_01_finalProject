
//define keywords 
var keywords=[];
//google Map
var map;


$(document).ready(function() {
    // make get request to api endpoint to get attributes
    $.get('http://127.0.0.1:8000/attributes', function(data) {
        console.log(data);
        // defining html elements for rendering attributes
        let attSection = document.getElementById("attributes-template").innerHTML;
        let attPlace = $(".attribute-all");
        
        //render attributes to website
        renderTemplate(attSection, attPlace, data);
        
        //changing class if attribut is selected and abend attribut id to keywords
        $("div.attribute").on('click', attributSelection);
        
    });

    //post keywords to Api to get places back
    $('#explore').on('click', proposeCity);
});

//select attributes and push sem into keywords array
function attributSelection() {
    //switch class for selected attributes
    $(this).toggleClass("attribute attribute-selected");

    // if attribute is selected push id to keywords array
    if($(this).hasClass("attribute-selected")){
        keywords.push($(this).attr("id"));
    }

    // if attribut is unselected remove id from keywords
    if($(this).hasClass("attribute")){
        attId = $(this).attr("id");
        keywords.splice($.inArray(attId, keywords),1);
    }

    console.log(keywords);
}

//rendering templates for html with Handlebars
function renderTemplate(source, tempPlace, data) {
    // compile the template
    var template = Handlebars.compile(source);

    // putting data in template
    var templateRended = template(data);

    // append template to website
    tempPlace.append(templateRended);
}

// proposing citys based on selected keywords
function proposeCity(){
    var page2 = document.getElementById("page2");
    page2.style.display = "block";

    var city;
    var allPlaces = [];

    $(".city-all").empty();

    // get request for cities based on keywords
    $.get('http://127.0.0.1:8000/places', { keywords: keywords.join(",") }, function(data) {
        
        allPlaces.push(data.places);
        
        //creating a city set out of all given places
        var cities= new Set();
        var i = "";

        //adding unique citys to list
        for( i in data.places){
            cities.add(data.places[i].city);
        }

        //creating list out of city set
        //console.log(cities);
        city = [...cities];

        // defining html elements for rendering cities
        let citySection = document.getElementById("city-template").innerHTML;
        let cityPlace = $(".city-all");

        //var context = {places: data, city: city};
        var context = {city: city};

        console.log(context);
 
        // rendering attributes to Website
        renderTemplate(citySection, cityPlace, context);

        //click on city to get more details for places in each city
        //var cityPlaces = document.getElementById("city-places");

        console.log("all places", allPlaces);

        //show places in city
        $("div.cities").on('click', function(){
            // deleteing all the previous content from overlay
            $(".overlay-content").empty();

            //getting the clicked city name 
            var city = $(this).attr("id");
            var locations = [];

            //selecting the places for clicked city
            for(i in data.places){
                if(data.places[i].city == city){
                    locations.push(data.places[i]);
                }
            }

            // rendering city template 
            var placesSection = document.getElementById("places-template").innerHTML;
            var cityPlaces = $(".overlay-content");
            var context = {places: locations};
            //console.log(context);
            renderTemplate(placesSection, cityPlaces, context);
            
            //opening overlay
            openDetails();

            //create map with places
            var citydetails = $("div.cities");
            google.maps.event.addDomListener(citydetails, 'click', initMap(locations, city));
          
        });

        //closing overlay
        $(".closebtn").on('click', function() {
            document.getElementById("myOverlay").style.width = "0";
        });
        
    });

    console.log()
}

// open the overlay with places 
function openDetails() {
    document.getElementById("myOverlay").style.width = "100%";
}

// creating map for each city
function initMap(places,city) {

        var geocoder = new google.maps.Geocoder();

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 0, lng: 0},
            zoom: 12,
        });
        
        geocoder.geocode({'address': city}, function(results, status){
            if (status ==='OK'){
                map.setCenter(results[0].geometry.location);
            }
            else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
        
        // adding markers for places
        for(let i = 0; i < places.length; i++){
            var index = i + 1;
            addMarker(places[i], index);
        }
    
}

// add marker for each place on map
function addMarker(place, index){
    let place_position = {"lat": place.lat, "lng": place.lng}
    console.log(index);
    let marker = new google.maps.Marker({
        position : place_position,
        label: String(index),
        map : map
    });
}


//helper for getting different classes in handlebars template
Handlebars.registerHelper('cycle', function(index) {
    index = index % (arguments.length - 2); // -2 to leave out `index` and the final argument HB adds
    return arguments[index + 1];
});

Handlebars.registerHelper("math", function(lvalue, operator, rvalue, options) {
    lvalue = parseFloat(lvalue);
    rvalue = parseFloat(rvalue);

    return {
        "+": lvalue + rvalue
    }[operator];
});




