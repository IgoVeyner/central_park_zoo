class AnimalsController < ApplicationController
  before_action :redirect_anon_users_to_home
  before_action :non_admin_error_message, only: [:new, :edit]
  before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def new
    @animal = Animal.new
    @species = Species.all
    @exhibits = Exhibit.all
  end

  def create
    @animal = Animal.new(animal_params)
    
    if @animal.save
      redirect_to animal_path(@animal)
    else
      @exhibits = Exhibit.all
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
      @exhibits = Exhibit.all
    else
      flash[:message] = "#{params[:id]} is not a valid Animal"
      render "partials/error"
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      @exhibits = Exhibit.all
      @species = Species.all
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :weight, :image_url, :description, :exhibit_id, :species_id)
  end

  def find_animal
    @animal = Animal.find_by_id(params[:id])
    redirect_to_errors_page(Animal.name) unless @animal
  end

  def get_all_species_and_exhibits
    @species = Species.all
    @exhibits = Exhibit.all
  end
end
