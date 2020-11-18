class AnimalsController < ApplicationController
  def index
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])

    if @exhibit 
      @animals = @exhibit.animals
    else 
      flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
      render "partials/error"
    end
  end

  private

  def find_animal
    @animal = Animal.find_by_id(params[:id])
    redirect_to_errors_page(Animal.name) unless @animal
  end
end
