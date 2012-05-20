
var GroupingSort = function(){
	return {

		list_id: "#grouping-sortables",
		form_id: "#sort-grouping-form",

		init: function(){
			$(this.list_id).sortable({
				handle: ".handle",
				placeholder: "ui-state-highlight",
				update: this.update_server
			});
		},

		update_server: function(){
			var form = $(GroupingSort.form_id);

			// post new order to server
			$.post( 
				form.attr("action"), 
				form.serialize(), 
				GroupingSort.update_client_with_status, 
				'json'
			);
	   	}, 

		update_client_with_status: function(data){
			if( data.status == false )
				alert( data.error_message );
		}


	};
}();

var init_grouping_sort = function() {
	GroupingSort.init();
}
$(document).ready(init_grouping_sort);
