class ApplicationController < ActionController::Base
  protect_from_forgery
  
  module ProductFilterPaginator
    def filter_products
      @products = if @products
                    @products.search params
                  else
                    Product.search params
                  end
    end
    def paginate_products
     @products = if @products
                    @products.page(params[:page]).per(8)
                  else
                    Product.page(params[:page]).per(8)
                  end
    end
  end
  
  module CartManager
    def load_cart_items
      @items = cart.items
      @cart_products = @items.collect { |item| Product.find(item.product_id) }
    end
    
    protected
    
    def cart
      return @cart if @cart
      session[:cart] ||= []
      @cart = Cart.new session[:cart]
    end    
  end
end
