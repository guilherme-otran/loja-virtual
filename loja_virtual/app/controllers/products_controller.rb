class ProductsController < ApplicationController
  include ProductFilterPaginator
  
  include CartManager
  helper_method :cart
  
  # GET /products/category/1
  # GET /products/
  def index
    @categories = Category.all
    
    # Initialize @products
    filter_products
    paginate_products
    
    respond_to do |format|
      format.html { render "welcome/index" }
      format.js   { render partial: "index" }
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
