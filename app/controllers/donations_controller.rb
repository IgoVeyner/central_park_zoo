class DonationsController < ApplicationController
  before_action :redirect_anon_users_to_home

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    if @donation.save 
      message = @donation.add_donation
      flash[:message] = message

      if message.include?("Sorry")
        render :new
      else
        redirect_to user_path(current_user)
      end
      
    else 
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :comment, :species_id)
  end
end
