class SessionController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by_id(params[:user_name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # add flash error message
      @users = User.all
      render :new
    end
  end
end
