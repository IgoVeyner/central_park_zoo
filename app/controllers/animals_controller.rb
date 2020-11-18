class AnimalsController < ApplicationController
  def index 
    @animals = Exhibit.find_by_id(params[:exhibit_id]).animals
  end
end
