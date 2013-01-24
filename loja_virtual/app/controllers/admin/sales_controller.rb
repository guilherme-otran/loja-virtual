class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.scoped
    @sales = @sales.by_created_date(params[:date]) if params[:date]
    @sales = @sales.page(params[:page]).per(10)
    respond_to do |f|
      f.html
    end
  end
end