class ErrorsController < ApplicationController
  #before_action :authenticate_user!, except: :action_here
  #skip_before_action :verify_authenticity_token 
  #skip_before_action :authenticate_user!, :only => "reply", :raise => false

  def not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end
  
  def internal_error
    respond_to do |format|
      format.html { render template: 'errors/internal_error', layout: 'layouts/error', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end
end
