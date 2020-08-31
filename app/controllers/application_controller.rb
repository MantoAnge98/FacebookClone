class ApplicationController < ActionController::Base
  #Module d'assistance
  protect_from_forgery with: :exception
  include SessionsHelper

  add_flash_types :danger, :info, :warning, :success

  #Si l'utilisateur actuellement connecté n'existe pas, 
  #redirigez-le vers la page de connexion.
  def authenticate_user
      if @current_user == nil
          flash[:notice] = t('notice.login_needed')
          redirect_to new_session_path
      end
  end

    
end
