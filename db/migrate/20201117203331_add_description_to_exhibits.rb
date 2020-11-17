class AddDescriptionToExhibits < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibits, :description, :string
  end
end
