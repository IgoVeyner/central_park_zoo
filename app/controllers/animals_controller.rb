class AnimalsController < ApplicationController
  before_action :redirect_anon_users_to_home
  before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def new
    @animal = Animal.new
    @species = Species.all
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
  end

  def create
    @animal = Animal.new(animal_params)
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
    
    if @animal.save
      redirect_to exhibit_animal_path(exhibit, @animal)
    else
      @species = Species.all
      render :new
    end
  end

  def index
    if params[:exhibit_id]
      @exhibit = Exhibit.find_by_id(params[:exhibit_id])

      if @exhibit 
        @animals = @exhibit.animals
      else 
        flash[:message] = "#{params[:exhibit_id]} is not a valid Exhibit"
        render "partials/error"
      end
    else
      @animals = Animal.all
    end
  end

  def show
    if params[:exhibit_id]  
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

  def edit
    if @animal
      @species = Species.all
      @exhibit = @animal.exhibit
    else
      flash[:message] = "#{params[:id]} is not a valid Animal"
      render "partials/error"
    end
  end

  def update
    @exhibit =  @animal.exhibit if @animal

    if @animal.update(animal_params)
      redirect_to exhibit_animal_path(@exhibit, @animal)
    else
      @species = Species.all
      render :edit
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :weight, :image_url, :description, :exhibit_id, :species_id)
  end

  def find_animal
    @animal = Animal.find_by_id(params[:id])
    redirect_to_errors_page(Animal.name) unless @animal
  end
end
