class ProductsController < ApplicationController
  
  # Filters  
  # before_filter :check_session_for_user_cart
  
  module ProductsPagingAndFilter
    def initialize_products_instance_var
      # Load categories for filter products
      @categories = Category.all
      
      # If has a category, filter and put to @products
      if params[:category].nil?
        @products = Product.page(params[:page]).per(4)
      else
        @products = Product.page(params[:page]).per(4).where(category_id: params[:category])
      end
    end
  end  
  include ProductsPagingAndFilter  
  
  # GET /products
  # GET /products.json
  def index
    # # Initializes the @products and @categories
    # initialize_products_instance_var
    @products = Product.search(params[:search]).page(params[:page]).per(4)

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: products_filter }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  # POST /products/1/add_to_cart
  # POST /products/1/add_to_cart.js
  # POST /products/1/add_to_cart.json
  def add_to_cart
    cart.add_item(params[:id].to_i)
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
      format.json { render json: cart }
    end
  end
  
  # DELETE /products/1/add_to_cart
  # DELETE /products/1/add_to_cart.js
  # DELETE /products/1/add_to_cart.json
  def remove_from_cart
    cart.remove_item(params[:id].to_i)
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
      format.json { render json: cart }
    end
  end  
end