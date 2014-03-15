$(document).ready(function() {
	$(".add_new_tour_image").click(function(){
		add_tour_image();
		return false;
	});
	
	//Add Days for itinerary
	$("#btnAddNew").click(function(){
		var new_id = $(".cloned-day-tours").length
		$('.cloned-day-tours:last')
			.after($(".cloned-day-tours:last")
			.clone()
			.attr("id", "day-" + new_id)
			.attr("class", "cloned-day-tours"));
		$('#day-' + new_id).find('label:first')
			.attr("for", "tour_tour_days_attributes_" + new_id + "_day_name")
		$('#day-' + new_id + ' input:first')
			.attr("id", "tour_tour_days_attributes_" + new_id + "_day_name")
			.attr("name", "tour[tour_days_attributes][" + new_id + "][day_name]")
		$('#day-' + new_id).find('label:last')
			.attr("for", "tour_tour_days_attributes_" + new_id + "_description")
		$('#day-' + new_id).find('textarea')
			.attr("id", "tour_tour_days_attributes_" + new_id + "_description")
			.attr("name", "tour[tour_days_attributes][" + new_id + "][description]")
		return false;
	});
});
function add_tour_image(){
	var newId = $(".clonedInput").length
	cloned_id = newId
	newId += 1
	$('.tour_image:last')
		.after($(".tour_image:last")
		.clone()
		.attr("id", "tour_image_" + newId)
		.attr("class", "clonedInput"));
	$('#tour_image_' + cloned_id + " a").remove();

	$("#tour_image_" + newId + " p input")
		.attr("id", "tour_tour_images_attributes_" + newId + "_attachment")
		.attr("name", "tour[tour_images_attributes][" + newId + "][attachment]")
		$(".add_new_tour_image").click(function(){
			add_tour_image();
			return false;
		});
}

