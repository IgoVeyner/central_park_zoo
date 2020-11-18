class SpeciesController < ApplicationController
  before_action :find_species, only: [:show]
  before_action :redirect_anon_users_to_home

  def index
    if params[:exhibit_id]
      @species_all = Exhibit.find_by_id(params[:exhibit_id]).species
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
