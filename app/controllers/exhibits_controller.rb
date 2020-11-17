class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.all
  end
end
