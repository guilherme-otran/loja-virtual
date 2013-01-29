class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.scoped
    @sales = @sales.by_between_date(params[:search][:date_start], params[:search][:date_end]) if params[:search]
    class << @sales
    	attr_accessor :period_total_price
    end
    @sales.period_total_price = @sales.sum(:total_price)
    @sales = @sales.page(params[:page]).per(15)
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