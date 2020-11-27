module UsersHelper
  def average_donation_amount(user)
    user.average_donation
  end

  def has_access
    id = params[:user_id] || params[:id]
    current_user == User.find_by_id(id)
  end

  def on_edit_page 
    page = current_page
    page.include?("edit")
  end
end
