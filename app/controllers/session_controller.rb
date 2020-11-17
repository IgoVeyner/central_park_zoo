class SessionController < ApplicationController
  before_action :all_users, only: [:new]

  def create
    @user = User.find_by_id(params[:user_name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # add flash error message
      all_users
      render :new
    end
  end

  private

  def all_users
    @users = User.all
  end
end
