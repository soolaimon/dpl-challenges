class AdminController < ApplicationController

  layout 'admin'

  USERNAME, PASSWORD = 'dude', 'password'

  before_filter :authenticate

  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USERNAME && password == PASSWORD
      end
    end

end
