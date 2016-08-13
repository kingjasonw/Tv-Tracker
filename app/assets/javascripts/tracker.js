$(document).ready(function(){
	$("#notice").delay(2000).fadeOut(1000);
});

var ready;
ready = (function() {
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  $("#series-search-input").autocomplete({
    source: '/series/autocomplete.json',
  });
});

$(document).ready(ready);
$(document).on('page:load', ready);


