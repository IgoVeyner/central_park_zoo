class DonationsController < ApplicationController
  before_action :redirect_anon_users_to_home
  before_action :find_species, only: [:index, :top_donor]

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
    if @species
      unless @species.donations.empty?
        @donations = @species.donations
      else
        flash[:message] = "No one has donated to #{@species.name} yet"
        return render "species/show"
      end
    end
  end

  def users_index
    user = User.find_by_id(params[:user_id])

    if user
      if helpers.has_donation_access
        @donations = user.donations
        render :index
      else
        flash[:message] = "You do not have access to see that"
        render "partials/error"
      end
    else
      flash[:message] = "#{params[:user_id]} is not a valid Guest"
      render "partials/error"
    end
  end

  def top_donor
    if @species
      unless @species.donations.empty?
        @user = @species.top_donor
      else
        flash[:message] = "No one has donated to #{@species.name} yet"
        return render "species/show"
      end
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :comment, :species_id)
  end

  def find_species
    @species = Species.find_by_id(params[:species_id])
    render_error(params[:species_id], Species.name, species_index_path) unless @species
  end
end
