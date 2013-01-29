class Admin::SalesController < Admin::ApplicationController
  def index
    @sales = Sale.scoped
    @sales = @sales.by_created_date(params[:date]) if params[:date]
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