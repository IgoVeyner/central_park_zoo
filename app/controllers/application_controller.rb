class ApplicationController < ActionController::Base
  private

  def redirect_anon_users_to_home
    redirect_to root_path unless authenticated
  end

  def redirect_already_logged_in
    redirect_to user_path(current_user) if authenticated
  end

  def authenticated
    !!current_user
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
