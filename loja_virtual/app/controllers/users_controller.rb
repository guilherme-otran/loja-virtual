class UsersController < ApplicationController
  def sales
    @sales = current_user.sales

    respond_to do |format|
      format.html 
      format.json { render json: @sales }
    end
  end
end