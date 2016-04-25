var map;  // Google map object
  
  // Initialize and display a google map
  $(function() {  
    // Create a Google coordinate object for where to initially center the map
    var latlng = new google.maps.LatLng( 49.2827, -123.1207 ); // Vancouver, BC
    
    var mapOptions = { zoom: 12, center: latlng };
    
    map = new google.maps.Map(document.getElementById('map'), mapOptions);

    // $( "input" ).blur( function( event ) {
      var geocoder = new google.maps.Geocoder();   
      
      // Get the user's inputted address
      var address = document.getElementById( "address" ).innerHTML;
      console.log(address);
    
      geocoder.geocode({ 'address': address + 'Vancouver, Canada'}, function(results, status) {
        var addr_type = results[0].types[0];  // type of address inputted that was geocoded
        if ( status == google.maps.GeocoderStatus.OK ) 
          ShowLocation( results[0].geometry.location, address, addr_type );
        else     
          alert("Geocode was not successful for the following reason: " + status);        
      });
    // } );
//     map.set('styles', [
//    {
//     featureType: 'landscape',
//     elementType: 'geometry',
//     stylers: [
//       { hue: '#2BB62B' },
//       { gamma: 0.4 },
//       { saturation: 52 },
//       { lightness: -10 }
//     ]
//   },
//     {
//       featureType: 'water',
//       elementType: 'geometry',
//       stylers: [
//         { hue: '#F5F8FA'},
//         { gamma: 0},
//         { saturation: 50},
//         { lightness: -30}
//       ]
//     }
// ]);
  } );
  
  // Show the location (address) on the map.
  function ShowLocation( latlng, address, addr_type )
  {
    // Center the map at the specified location
    map.setCenter( latlng );
    
    // Set the zoom level according to the address level of detail the user specified
    var zoom = 12;
    switch ( addr_type )
    {
    case "administrative_area_level_1"  : zoom = 6; break;    // user specified a state
    case "locality"           : zoom = 10; break;   // user specified a city/town
    case "street_address"       : zoom = 15; break;   // user specified a street address
    }
    map.setZoom( zoom ); 
    
    var marker = new google.maps.Marker( { 
      position: latlng,     
      map: map,      
      title: address
    });
    
    var contentString = "<b>" + address + "</b>"; // HTML text to display in the InfoWindow
    var infowindow = new google.maps.InfoWindow( { content: contentString } );
    
    google.maps.event.addListener( marker, 'click', function() { infowindow.open( map, marker ); });
  
  
  }