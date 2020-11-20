class AnimalsController < ApplicationController
  before_action :redirect_anon_users_to_home

  def new
    @animal = Animal.new
    @species = Species.all
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
  end

  def index
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])

    if @exhibit 
      @animals = @exhibit.animals
    else 
      flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
      render "partials/error"
    end
  end

  def show
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])

    if @exhibit 
      @animal = @exhibit.animals.find_by_id(params[:id])
      redirect_to_errors_page(Animal.name) unless @animal
    else 
      flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
      render "partials/error"
    end
  end
end
