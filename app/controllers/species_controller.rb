class SpeciesController < ApplicationController
  before_action :find_species, only: [:show]
  before_action :redirect_anon_users_to_home

  def index
    if params[:exhibit_id]
      @exhibit = Exhibit.find_by_id(params[:exhibit_id])

      if @exhibit
        @species_all = @exhibit.species
      else
        flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
        render "partials/error"
      end
    else
      @species_all = Species.all
    end
  end

  private 

  def find_species
    @species = Species.find_by_id(params[:id])
    redirect_to_errors_page(Species.name) unless @species
  end
end
