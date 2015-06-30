$(document).ready(function(){
	searchAgainListener();
	$('#direction-panel').hide();
	$('#directions-map').hide();
	$('#search-again').hide();

	$('.new_building').on('submit',function(e){
		e.preventDefault();
		e.stopPropagation();
		var buildingNum = $("#building_building_num").val();
		var street = $("#building_street").val();
		var streetSuffix = $("#building_street_suffix").val();
		var url = 'building/' + buildingNum + '/' + street + '/' + streetSuffix;
		if(buildingNum && street && streetSuffix){
			$.ajax({
				url: url,
				method: 'get',
				dataType: 'script'
			});
		}
		else if(!buildingNum && !street){
			$('#building_building_num').attr('placeholder', 'Enter a building number');
			$('#building_street').attr('placeholder', 'Enter a street');
			}
		else if(!buildingNum){
			$('#building_building_num').attr('placeholder', 'Enter a building number');
			}
		else if(!street){
			$('#building_street').attr('placeholder', 'Enter a street');
			}
	});
});

function searchAgainListener(){
	$('footer').on('click', '#search-again', function(e){
		// tests if div is on page
		// it will not be on an html show page so preventDefault will not run and button will act normally (i.e., return to root by refreshing page)
		if ($('#search-instructions').length){
		e.preventDefault();
		$('#results').empty();
		$('#search-instructions').fadeIn();
		$('#building_building_num').val('');
		$('#building_street').val('');
		$('.new_building').fadeIn();
		$('#direction-panel').hide();
		$('#direction-panel').empty();
		$('#directions-map').hide();
		$(this).hide();
		}
	});
}