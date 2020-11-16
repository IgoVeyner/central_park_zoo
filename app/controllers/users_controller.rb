class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise "users#create".inspect
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :birthdate, :funds, :admin)
  end
end
