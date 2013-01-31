jQuery ($) ->
  $(".purchase-items").hide()

  $(".purchase-header").on "click", ->
    $(this).siblings(".purchase-items").slideToggle("fast")

  $(".purchase-footer").on "click", ->
    $(this).siblings(".purchase-items").slideToggle("fast")
  
  $(".single-purchase").toggle ->
      details = $(this).children().children(".label-details")
      details.html(details.data("info-close"))
    ,->
      details = $(this).children().children(".label-details")
      details.html(details.data("info-open"))
      
  $(".purchase-items").click (event) ->
    event.stopPropagation()