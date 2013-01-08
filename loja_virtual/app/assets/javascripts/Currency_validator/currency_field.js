jQuery(function($){

  var fix_currency = function(){
  	var value = $(this).val();

  	var validate = value.replace(',' , "");
  	if(isNaN(validate)){
    	value = "";
  	}

  	if(value === ""){ 
  		value = "0,00";
  	} else {
    	value = parseFloat(value.replace(/[R$\s]/g, "").replace(',' , '.'));
    	value = value.toFixed(2).replace('.' , ',');
  	}

		$(this).val(value);
	}

  $(".form-inputs").delegate(".currency_field", "focusout", fix_currency);

  $(".form-inputs").delegate(".currency_field", "focusin", function(){
    if ($(this).val() === "0,00") {
      $(this).val("");
    }
  });

});