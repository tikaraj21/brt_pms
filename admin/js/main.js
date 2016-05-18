$(function(){

//alert('success.');
//it is for get the click of the create button
	$('#modalButton').click(function(){
		$('#modal').modal('show')
		.find('#modalContent')
		.load($(this).attr('value'));
	});
	
	$('#modalButton1').click(function(){
		$('#modal1').modal('show')
		.find('#modalContent1')
		.load($(this).attr('value'));
	});
});

