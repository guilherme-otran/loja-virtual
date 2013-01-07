jQuery(function($){

  var fix_currency = function(){
  var value = $(this).val();
  
  value = value.replace(/\s+/g, "");
  var validate = value.replace(',' , "");

  if(isNaN(validate)){
    value = "";
  }

  if(value === ""){ 
    $(this).val("0,00");
    } else {
    value = parseFloat(value.replace(/[R$\s]/g, "").replace(',' , '.'));
    $(this).val(value.toFixed(2).replace('.' , ','));
    }
  }

  $(".form-inputs").delegate(".currency_field", "focusout", fix_currency);

  fix_currency.apply($(".currency_field"));

  $(".form-inputs").delegate(".currency_field", "focusin", function(){
    if ($(this).val() === "0,00") {
      $(this).val("");
    }
  });

});