module ApplicationHelper
  def is_admin
    current_user.admin
  end

  def is_nested
    params[:exhibit_id]
  end

  def current_page
    request.env['PATH_INFO']
  end

  def on_signup_or_login_page
    page = current_page
    page == '/signup' || page == '/login'
  end

  def on_welcome_page
    page = current_page
    page == '/'
  end

  def on_new_form_page 
    page = current_page
    page == "/signup" || page.include?("new")
  end
end
