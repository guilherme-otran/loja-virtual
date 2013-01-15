// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery-ui-1.9.2.custom.min
//= require_tree .

// jQuery(function() {
// 	$('.pagination').delegate('a', 'click', function(event) {
// 		event.preventDefault();
// 		var productsDiv = $('.all-products');
// 		$.ajax({
// 			url: $(this).attr('href'), // this é o cara que chamou o evento
// 			type: 'GET',
// 			success: function(page) {
// 				productsDiv.html(page);
// 			}
// 		})
// 	})
// })
jQuery(function($){
  var search_field = $("input#search_field");
  
  search_field.on("keyup", function() {
    if (search_field.val() === "") {
      $("#search_form").submit();
    }
  });

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