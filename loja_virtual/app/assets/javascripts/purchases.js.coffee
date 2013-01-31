jQuery ($) ->
  $(".purchase-items").hide()

  $(".purchase-header").on "click", ->
    $(this).siblings(".purchase-items").slideToggle("fast")

  $(".purchase-footer").on "click", ->
    $(this).siblings(".purchase-items").slideToggle("fast")

