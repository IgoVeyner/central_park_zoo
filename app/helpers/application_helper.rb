module ApplicationHelper
  def is_admin
    current_user.admin
  end

  def is_nested
    params[:exhibit_id]
  end
end
