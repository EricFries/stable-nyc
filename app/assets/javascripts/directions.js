$(document).ready(function(){
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var start = new google.maps.LatLng(41.850033, -87.6500523);
    var mapOptions = {
      zoom:7,
      center: start
    };
    map = new google.maps.Map(document.getElementById("directions-map"), mapOptions);
    directionsDisplay.setMap(map);
  }

  function calcRoute() {
    var start = $("#start-address").html();
    var end = $("#end-address").html();
    var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.TravelMode.TRANSIT
    };
    debugger
    directionsService.route(request, function(result, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(result);
      }
    });
  }
  initialize();
  calcRoute();

});

