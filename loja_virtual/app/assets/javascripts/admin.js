jQuery(function($){
	var search_field = $("input#admin_search_field");

	$("#admin_search_form").on("submit", function(event){
    event.preventDefault();
    $.ajax({
      dataType: "script",
      url: this.action,
      data: $(this).serialize()
    })
  }); 

  search_field.on("keyup", function() {
    if (search_field.val() === "") {
      $("#admin_search_form").submit();
    }
  });
});