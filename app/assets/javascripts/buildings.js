$(document).ready(function(){
	searchAgainListener();
	$('.new_building').on('submit',function(e){
		e.preventDefault();
		e.stopImmediatePropagation();
		var url = 'building/' + $("#building_building_num").val() + '/' + $("#building_street").val() + '/' + $("#building_street_suffix").val();
		$.ajax({
			url: url,
			method: 'get',
			dataType: 'script'
		});
	});
});

function searchAgainListener(){
	$('#results').on('click', '#search-again', function(e){
		e.preventDefault();
		$('#search-instructions').fadeIn();
		$('#result').fadeOut();
		$('#map').fadeOut();
		$('.new_building').fadeIn();
	});
}