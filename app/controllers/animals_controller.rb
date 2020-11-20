class AnimalsController < ApplicationController
  before_action :redirect_anon_users_to_home

  def new
    @animal = Animal.new
    @species = Species.all
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
  end

  def create
    @animal = Animal.new(animal_params)
    @species = Species.all
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])

    if @animal.save
      redirect_to exhibit_animal_path(exhibit, @animal)
    else
      render :new
    end
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

  def edit
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
    
    if @exhibit
     @animal = @exhibit.animals.find_by_id(params[:id])
    
      if @animal
        @species = Species.all
      else
        flash[:message] = "#{params[:id]} is not a valid Animal or is does not belong to this Exhibit"
        render "partials/error"
      end

    else
      flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
      render "partials/error"
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :weight, :image_url, :description, :exhibit_id, :species_id)
  end
end
