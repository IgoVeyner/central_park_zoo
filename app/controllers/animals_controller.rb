class AnimalsController < ApplicationController
  before_action :redirect_anon_users_to_home
  before_action :non_admin_error_message, only: [:new, :edit]
  before_action :find_animal, only: [:edit, :update, :destroy]
  before_action :get_all_species_and_exhibits, only: [:new, :edit]

  def new
    @animal = Animal.new
    find_exhibit if params[:exhibit_id]
  end

  def create
    @animal = Animal.new(animal_params)
    
    if @animal.save
      redirect_to animal_path(@animal)
    else
      get_all_species_and_exhibits
      render :new
    end
  end

  def index
    if params[:exhibit_id]
      find_exhibit
      @animals = @exhibit.animals if @exhibit
    else
      @animals = Animal.all
    end
  end

  def show
    if params[:exhibit_id]  
      find_exhibit

      if @exhibit
        @animal = @exhibit.animals.find_by_id(params[:id])
        render_error(params[:id], Animal.name, exhibit_animals_path(@exhibit)) unless @animal
      end
    else 
      find_animal
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      get_all_species_and_exhibits
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
    render_error(params[:id], Animal.name, animals_path) unless @animal
  end

  def find_exhibit
    @exhibit = Exhibit.find_by_id(params[:exhibit_id])
    render_error(params[:exhibit_id], Exhibit.name, exhibits_path) unless @exhibit
  end

  def get_all_species_and_exhibits
    @species = Species.all
    @exhibits = Exhibit.all
  end
end
