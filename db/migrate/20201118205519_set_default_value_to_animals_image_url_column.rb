class SetDefaultValueToAnimalsImageUrlColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :animals, :image_url, :string, default: "https://www.drupal.org/files/issues/2019-07-21/missing.png"
  end

  def down
    change_column :animals, :image_url, :string, default: nil
  end
end
