module AnimalsHelper
  def set_url
    @exhibit ? new_exhibit_animal_path(@exhibit) : new_animal_path
  end
end
