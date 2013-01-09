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
	});
	
	$(".all-products").on("click", ".category-link", function(event){
		event.preventDefault();
		//$("#products_and_paginator").load($(this).data("ajax-href"));
    $.getScript($(this).data("ajax-href"));
	});
	
	$("#products_and_paginator").on("click", "a", function(event){
		event.preventDefault();
		//$("#products_and_paginator").load($(this).attr('href'));
		$.getScript(this.href);
	});
});