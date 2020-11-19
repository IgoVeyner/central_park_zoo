class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    if @donation.save 
      # user.donate(@donation)
      # add flash message
      # redirect
    else 
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :comment, :species_id)
  end
end
