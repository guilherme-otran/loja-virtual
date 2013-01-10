jQuery(function($){
  
	var productsDiv = $("div#products_and_paginator");
	productsDiv.delegate("a.btn-add-to-cart","click", function(event){
	  event.preventDefault();
		$.ajax({
			dataType: "script",
			url: $(this).attr("href"),
			data: { id: $(this).data.id	},
			type: "POST"
		})
	})
	
	var cartDiv = $("div.shop-cart");
  cartDiv.delegate("a.btn-remove-from-cart","click", function(event){
    event.preventDefault();
    $.ajax({
      dataType: "script",
      url: $(this).attr("href"),
      data: { id: $(this).data.id },
      type: "DELETE"
    })
  })    

  $("#search_form").on("submit", function(event){
    event.preventDefault();
    $.ajax({
      dataType: "script",
      url: this.action,
      data: $(this).serialize()
    })
  });
  
	$("select#categories_select").on("change", function(event){
    var selected = $(this).find(":selected");
    $.getScript(selected.data("ajax-href"));
    // Refresh search form link
    $("#search_form").get(0).setAttribute('action', selected.data("ajax-href"));
	});
	
	$("div#products_and_paginator").on("click", "#paginator a", function(event){
		event.preventDefault();
		$.getScript(this.href);
	});
});
