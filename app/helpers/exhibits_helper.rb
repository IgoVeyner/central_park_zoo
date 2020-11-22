module ExhibitsHelper

  def find_exhibit_or_redirect
    id = params[:exhibit_id] || params[:id]
    @exhibit = Exhibit.find_by_id(id) 
    render_error(id, Exhibit.name, exhibits_path) unless @exhibit
  end 

end
