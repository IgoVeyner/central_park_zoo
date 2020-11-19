class SetDefaultForSpeciesDonationTotalColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :species, :donation_total, :integer, default: 0
  end

  def down
    change_column :species, :donation_total, :integer, default: nil
  end
end
