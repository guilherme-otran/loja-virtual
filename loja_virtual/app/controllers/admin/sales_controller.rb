class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.scoped
    @sales = @sales.by_between_date(params[:search][:date_start], params[:search][:date_end]) if params[:search]
    @sales = @sales.page(params[:page]).per(10)
    respond_to do |f|
      f.html
    end
  end

  def show
  	@sale = Sale.find(params[:id])
  	@sale_items = @sale.sale_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end