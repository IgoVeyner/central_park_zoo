class ExhibitsController < ApplicationController
  before_action :find_exhibit, only: [:show]
  before_action :redirect_anon_users_to_home

  def index
    @exhibits = Exhibit.all
  end

  private 

  def find_exhibit
    @exhibit = Exhibit.find_by_id(params[:id])
  end 
end
