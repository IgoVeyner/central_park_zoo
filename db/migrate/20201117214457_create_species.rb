class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :name
      t.string :common_name
      t.string :conservation_status
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
