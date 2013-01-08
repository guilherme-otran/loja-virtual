class ProductsController < ApplicationController
  
  # Filters  
  # before_filter :check_session_for_user_cart
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.page(params[:page]).per(6)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
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
    @product = Product.find(params[:id])
    
    cart.add_item(@product.id)
    
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @product }
    end
  end
end
