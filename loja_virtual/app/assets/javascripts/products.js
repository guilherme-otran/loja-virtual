jQuery(function($){
	var productsDiv = $("div.all-products");
	
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
})