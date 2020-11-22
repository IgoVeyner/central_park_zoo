module ApplicationHelper
  def is_admin
    current_user.admin
  end

  def render_error(id, class_name, target)
    flash[:message] = "#{id} is not a valid #{class_name}"
    redirect_to target
  end
end
