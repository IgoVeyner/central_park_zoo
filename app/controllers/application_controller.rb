class ApplicationController < ActionController::Base
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
    User.find_by_id(session[:user_id])
  end

  def redirect_to_errors_page(arg_class)
    flash[:message] = "#{params[:id]} is not a valid #{arg_class}"
    render "partials/error"
  end
end
