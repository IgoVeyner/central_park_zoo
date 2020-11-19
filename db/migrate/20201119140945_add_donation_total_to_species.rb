class AddDonationTotalToSpecies < ActiveRecord::Migration[5.2]
  def change
    add_column :species, :donation_total, :integer
  end
end
