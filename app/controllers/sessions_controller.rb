class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to users_path, notice: "You are already logged"
    else
     render :new
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)  
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Connected!'
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Connexion failure, Please try again or Sign up'
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
