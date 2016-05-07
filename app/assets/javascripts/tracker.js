$(document).ready(function() {
	$('#notice').delay(1000).fadeOut(1000);

	var apiKey = 'AIzaSyDoJiOxIjx_e62xUqIaSyLzyf9ZwPUHJxA'
	var myInput = document.getElementById("myInput");
    var config = {
      'limit': 5,
      'languages': ['en'],
      'types': ['TVSeries'],
      'maxDescChars': 100,
    };

    var picker = KGSearchWidget(apiKey, myInput, config);
}); 