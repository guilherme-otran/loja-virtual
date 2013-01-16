class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Modules
  module ProductFilterPaginator
    def filter_products
      @products = (@products || Product).search(params)
    end

    def paginate_products
      @products = (@products || Product).page(params[:page]).per(8)    
    end
  end
  
  module CartManager
    def load_cart_items
      @items          = cart.items
      @cart_products  = @items.collect { |item| Product.find(item.product_id) }
    end
    
    protected
    
    def cart
      return @cart if @cart
      session[:cart] ||= []
      @cart = Cart.new session[:cart]
    end    
  end
end
