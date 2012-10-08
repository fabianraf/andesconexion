$(document).ready(function() {
	$(".add_new_tour_image").click(function(){
		add_tour_image();
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

