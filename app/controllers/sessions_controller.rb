class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)  
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Connexion failure'
      render :new
    end

  end

   #Instance pour détruire une session 'utilisateur'
   def destroy
    session.delete(:user_id)
    flash[:notice] = 'Log Out'
    redirect_to new_session_path   
  end
  
end
