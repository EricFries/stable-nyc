$(document).ready(function(){
	searchAgainListener();
	$('.new_building').on('submit',function(e){
		e.preventDefault();
		e.stopImmediatePropagation();
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
	$('#results').on('click', '#search-again', function(e){
		e.preventDefault();
		$('#search-instructions').fadeIn();
		$('#result').fadeOut();
		$('#map').fadeOut();
		$('.new_building').fadeIn();
	});
}