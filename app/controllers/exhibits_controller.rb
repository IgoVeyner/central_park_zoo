class ExhibitsController < ApplicationController
  before_action :find_exhibit, only: [:show]

  def index
    @exhibits = Exhibit.all
  end

  private 

  def find_exhibit
    @exhibit = Exhibit.find_by_id(params[:id])
  end 
end
