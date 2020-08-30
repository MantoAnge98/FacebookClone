class ErrorsController < ApplicationController
    before_action :authenticate_user!, except: :action_here
    #skip_before_action :verify_authenticity_token 
    #skip_before_action :authenticate_user!, :only => "reply", :raise => false

    def not_found
      respond_to do |format|
        format.html { render status: 404 }
      end
    end 
  
    def internal_error
      respond_to do |format|
        format.html { render status: 500 }
      end
    end
end
