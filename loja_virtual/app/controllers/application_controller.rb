class ApplicationController < ActionController::Base
  protect_from_forgery
  
  module ProductFilterPaginator
    def load_filtered_and_pagined_products    
      # If has a category, filter and put to @products
      @products = if params[:category_id].nil?
                    Product.page(params[:page]).per(4)
                  else
                    Product.where(category_id: params[:category_id]).page(params[:page]).per(4)
                  end
    end
  end
  
  protected
  
  helper_method :cart
  def cart
    return @cart if @cart
    session[:cart] ||= []
    @cart = Cart.new session[:cart]
  end
end
