class SpeciesController < ApplicationController

  def index
    @species_all = Species.all
  end

  private 

  def find_species
    @species = Species.find_by_id(params[:id])
    redirect_to_errors_page(Species.name) unless @species
  end
end
