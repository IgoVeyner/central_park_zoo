class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :image_url
      t.string :description
      t.integer :exhibit_id
      t.integer :species_id

      t.timestamps
    end
  end
end
