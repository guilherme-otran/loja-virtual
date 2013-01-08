class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  helper_method :cart
  
  def cart
    return @cart if @cart
    session[:cart] ||= []
    @cart = Cart.new session[:cart]
  end
  
end
