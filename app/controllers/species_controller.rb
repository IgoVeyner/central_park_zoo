class SpeciesController < ApplicationController
  before_action :redirect_anon_users_to_home
  before_action :non_admin_error_message, only: [:new, :edit]
  before_action :find_species, only: [:show, :edit, :update, :destroy]

  def index
    if params[:exhibit_id]
      @exhibit = Exhibit.find_by_id(params[:exhibit_id])

      if @exhibit
        @species_all = @exhibit.species.uniq
      else
        flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
        render "partials/error"
      end
    else
      @species_all = Species.all
    end
  end

  def new
    @species = Species.new
  end

  def create
    @species = Species.new(species_params)

    if @species.save
      redirect_to species_path(@species)
    else
      render :new
    end
  end

  def update
    if @species.update(species_params)
      redirect_to species_path(@species)
    else 
      render :edit
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path
  end

  private 

  def find_species
    @species = Species.find_by_id(params[:id])
    redirect_to_errors_page(Species.name) unless @species
  end

  def species_params
    params.require(:species).permit(:name, :common_name, :conservation_status, :image_url, :description)
  end
end
