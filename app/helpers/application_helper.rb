module ApplicationHelper
  def is_admin
    current_user.admin
  end

  def is_nested
    params[:exhibit_id]
  end

  def on_signup_or_login_page
    page = request.env['PATH_INFO']
    page == '/signup' || page == '/login'
  end

  def on_welcome_page
    page = request.env['PATH_INFO']
    page == '/'
  end
end
