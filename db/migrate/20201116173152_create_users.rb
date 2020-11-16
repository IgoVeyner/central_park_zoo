class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.datetime :birthdate
      t.integer :funds
      t.boolean :admin
      t.timestamps
    end
  end
end
