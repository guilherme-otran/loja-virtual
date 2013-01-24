require 'cart_manager'
class FinishBuyController < ApplicationController
	before_filter :root_path_if_cart_empty
	
	include CartManager
	
	def index
		if user_signed_in?
			# redirect_to finish_buy_pay_path
			self.pay
			
			return
		end
		
		redirect_to finish_buy_login_path
	end
	
	def login
  	if user_signed_in?
  		redirect_to finish_buy_pay_path
  	end
  	
  	# flash[:login_paths] = { success: finish_buy_pay_path }
  	
  	# render same name view
	end
	
  def pay
  	if !user_signed_in?
  		# TODO: error
  	end
  end
  
  private
  
  def root_path_if_cart_empty
  	if cart.items.empty?
  		redirect_to root_path
  	end
  end
end