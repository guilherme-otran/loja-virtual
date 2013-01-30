module DeviseUtils
  module ContentHelper
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end
  
  module BackSignIn
    def redirect_finish_buy_login_url
      # finish_url = url_for action: 'login', controller: '/finish_buy', only_path: false, protocol: 'http'
      if request.referer == finish_buy_login_url
        finish_buy_login_url
      end
    end
    
    def after_sign_in_path_for(resource)
      redirect_finish_buy_login_url || super
    end
  end
  
  class CustomFailure < Devise::FailureApp
    def redirect_finish_buy_login_url
      # finish_url = url_for action: 'login', controller: '/finish_buy', only_path: false, protocol: 'http'
      if request.referer == finish_buy_login_url
        finish_buy_login_url
      end
    end
    
    def redirect_url
      redirect_finish_buy_login_url || super
    end

    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
  end
end