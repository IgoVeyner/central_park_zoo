class ExhibitsController < ApplicationController
  before_action :find_exhibit, only: [:show]
  before_action :redirect_anon_users_to_home

  def index
    @exhibits = Exhibit.all
  end

  def new
    @exhibit = Exhibit.new
  end

  private 

  def find_exhibit
    @exhibit = Exhibit.find_by_id(params[:id])
    redirect_to_errors_page(Exhibit.name) unless @exhibit
  end 
end
