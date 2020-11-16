class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :birthdate, :funds, :admin)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
