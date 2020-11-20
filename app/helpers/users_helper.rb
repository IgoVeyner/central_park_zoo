module UsersHelper
  def average_donation_amount(user)
    user.average_donation
  end

  def has_access
    User.find_by_id(session[:user_id]) == User.find_by_id(params[:id])
  end
end
