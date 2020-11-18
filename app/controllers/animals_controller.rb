class AnimalsController < ApplicationController
  def index
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
    @animals = @exhibit.animals
  end
end
