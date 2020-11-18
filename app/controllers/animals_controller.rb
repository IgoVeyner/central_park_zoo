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
end
