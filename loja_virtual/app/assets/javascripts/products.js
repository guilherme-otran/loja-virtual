jQuery(function($){
  

  var current_product_quantity = 0
	var productsDiv = $("div#products_and_paginator");
	
	productsDiv.delegate("a.btn-add-to-cart","click", function(event){
	  event.preventDefault();
		$.ajax({
			dataType: "script",
			url: $(this).attr("href"),
			type: "POST"
		});
	});
	var cartDiv = $("div.shop-cart");
  cartDiv.delegate("a.btn-remove-from-cart","click", function(event){
    event.preventDefault();
    $.ajax({
      dataType: "script",
      url: $(this).attr("href"),
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
  
  cartDiv.delegate("input.txt-product-quantity", "focusin", function(event){
    current_product_quantity = $(this).val();
  });
  
  cartDiv.delegate("input.txt-product-quantity", "change", function(event){
    event.preventDefault();
    if (isNaN($(this).val()))
    {
      alert("Por favor digite uma quantidade válida");
      $(this).val(current_product_quantity);
    }
    else
      $.ajax({
        dataType: "script",
        url: $(this).data().path +".js",
        type: "PUT",
        data: { quantity: $(this).attr("value") }
      });
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
