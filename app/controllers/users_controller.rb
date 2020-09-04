class UsersController < ApplicationController
  def index
      @user = User.all
  end

  def new
    if logged_in?
      redirect_to users_path, notice: "You are already logged"
    else
      @user = User.new
    end
  end

  def create
    if logged_in?
      redirect_to users_path, notice: "You are already logged"
    else    
      @user = User.new(user_params)
      if @user.save
          #redirect_to user_path(@user.id) 
          redirect_to new_session_path, notice: "Account create, please log In"
      else
          render :new
      end
    end
  end

  #Pour montrer le contenu enregistrer
  def show
      @user = User.find(params[:id])
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
