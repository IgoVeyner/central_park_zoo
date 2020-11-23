module UsersHelper
  def average_donation_amount(user)
    user.average_donation
  end

  def has_access
    id = params[:user_id] || params[:id]
    User.find_by_id(session[:user_id]) == User.find_by_id(id)
  end
end
