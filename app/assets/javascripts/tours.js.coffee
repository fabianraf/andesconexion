$(document).ready ->
	$(".contracted-link").click( ->
		a_text = $(this).text().substring(1)
		if $(this).next().attr("class") == "hidden-field"
			$(this).next().attr("class", "visible-field")
			$(this).text("- " + a_text)
			
		else
			if $(this).next().attr("class") == "visible-field"
				$(this).next().attr("class", "hidden-field")
				$(this).text("+ " + a_text)
		return false
		)
	$('#submit_book_now').click( ->
		$('#new_book').submit()
		)