class ApplicationController < ActionController::Base
  private

  def authenticated
    !!current_user
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
