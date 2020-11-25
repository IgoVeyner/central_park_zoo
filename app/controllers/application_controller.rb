class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :authenticated
  
  private

  def redirect_anon_users_to_home
    redirect_to root_path unless authenticated
  end

  def redirect_already_logged_in
    if authenticated
      flash[:message] = "You are already logged in"
      redirect_to user_path(current_user)
    end
  end

  def authenticated
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def render_error(id, class_name, target)
    flash[:message] = "#{id} is not a valid #{class_name}"
    redirect_to target
  end

  def non_admin_error_message
    unless helpers.is_admin
      flash[:message] = "You do not have access to this"
      render "partials/error" 
    end
  end
end
