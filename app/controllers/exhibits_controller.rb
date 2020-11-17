class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.all
  end

  private 

  def find_exhibit
    @exhibit = Exhibit.find_by_id[params[:id]]
  end 
end
