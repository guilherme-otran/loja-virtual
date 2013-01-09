class ProductsController < ApplicationController
  include ProductFilterPaginator
  
  # GET /products/category/1
  # GET /products/
  def index
    @categories = Category.all
    
    # Initialize @products
    load_filtered_and_pagined_products
    
    respond_to do |format|
      format.html { render root_path }
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
    @product = Product.find(params[:id])
    
    cart.add_item(@product.id)
    
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @product }
    end
  end
end
