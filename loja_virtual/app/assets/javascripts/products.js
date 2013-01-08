jQuery(function($){
	var addButton = $("a.btn-add-to-cart");
	addButton.on("click", function(event){
	  event.preventDefault();
		$.ajax({
			dataType: "script",
			url: $(this).attr("href"),
			data: {
			  id: $(this).data.id
		 	},
			type: "POST"
		})
	})
})