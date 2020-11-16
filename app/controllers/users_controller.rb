class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise "users#create".inspect
  end
end
