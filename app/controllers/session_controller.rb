class SessionController < ApplicationController
  def new
    @users = User.all
  end
end
