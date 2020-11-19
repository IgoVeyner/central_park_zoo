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
  
  def index
    argument = params[:species_id] ? Species.find_by_id(params[:species_id]) : User.find_by_id(params[:user_id]) 

    if argument
      @donations = argument.donations
    else
      flash[:message] = "#{params[:species_id] || params[:user_id]} is not a valid #{params[:species_id] ? "Species" : "Guest"}"
      render "partials/error"
    end
  end

  def top_donor
    @species = Species.find_by_id(params[:species_id])

    if @species
      top_donation = @species.donations.maximum(:amount)
      @donation = @species.donations.find_by(amount: top_donation)
      render :show
    else
      flash[:message] = "#{params[:species_id]} is not a valid Species"
      render "partials/error"
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :comment, :species_id)
  end
end
