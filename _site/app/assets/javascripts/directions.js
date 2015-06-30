function getDirections(){
  $(document).ready(function(){
  $('#direction-panel').show();
  $('#directions-map').show();
  $('#search-again').show();

    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;

    function initialize() {
      directionsDisplay = new google.maps.DirectionsRenderer();
      var start = new google.maps.LatLng(40.6928, -73.9903);
      var mapOptions = {
        zoom: 14,
        center: start
      };
      map = new google.maps.Map(document.getElementById("directions-map"), mapOptions);
      directionsDisplay.setMap(map);
      directionsDisplay.setPanel(document.getElementById("direction-panel"));
    }

    function calcRoute() {
      var start = $("#start-address").html();
      var end = $("#end-address").html();
      var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode.TRANSIT,
        provideRouteAlternatives: true
      };

      directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
        }
      });
    }
    initialize();
    calcRoute();
  });
}
