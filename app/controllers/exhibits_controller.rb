class ExhibitsController < ApplicationController
  include ExhibitsHelper

  before_action :redirect_anon_users_to_home
  before_action :non_admin_error_message, only: [:new, :edit]
  before_action :find_exhibit_or_redirect, only: [:show, :edit, :update, :destroy]

  def index
    @exhibits = Exhibit.all
  end

  def new
    @exhibit = Exhibit.new
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)

    if @exhibit.save
      redirect_to exhibit_path(@exhibit)
    else
      render :new
    end
  end

  def update
    if @exhibit.update(exhibit_params)
      redirect_to exhibit_path(@exhibit)
    else
      render :edit
    end
  end

  def destroy
    @exhibit.destroy
    redirect_to exhibits_path
  end

  private 

  def exhibit_params
    params.require(:exhibit).permit(:name, :biome, :image_url, :description)
  end
end
