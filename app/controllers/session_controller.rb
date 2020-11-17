class SessionController < ApplicationController
  before_action :all_users, only: [:new]
  before_action :redirect_already_logged_in, only: [:new]

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      @user = User.find_by_id(params[:user_name])
      
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:message] = "Incorrect Password"
        all_users
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def all_users
    @users = User.all
  end
end
