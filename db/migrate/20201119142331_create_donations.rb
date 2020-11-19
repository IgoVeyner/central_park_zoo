class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :comment
      t.integer :user_id
      t.integer :species_id

      t.timestamps
    end
  end
end
