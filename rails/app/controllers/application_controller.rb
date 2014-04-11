class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :current_account
  
  private
    
    def current_session
      return @current_session if defined?(@current_session)
      @current_session = AccountSession.find
    end
    
    def current_account
      return @current_account if defined?(@current_account)
      @current_account = current_session && current_session.record
    end
    
    #Fails on IE. Implemented this in .htaccess
    # def check_uri
    #       unless Rails.env.development?
    #         headers["Status"] = "301 Moved Permanently"
    #         redirect_to request.protocol + "www." + request.host_with_port + request.request_uri if !/^www/.match(request.host)
    #       end
    #     end
  
end
