class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    raise "donations#create".inspect
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :comment, :species_id)
  end
end
