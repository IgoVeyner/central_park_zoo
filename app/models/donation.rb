class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :species

  validates :amount, presence: true
  validates :amount, numericality: {greater_than: 0, less_than_or_equal_to: 1000000}
  validates :comment, length: { maximum: 300 }

  def add_donation
    new_user_finds = user.funds - amount
    new_species_donation_total = species.donation_total + amount
    user.update(funds: new_user_finds)
    species.update(donation_total: new_species_donation_total)
  end
  
  def valid
    "Thanks for donating $#{amount} to #{species.name}"
  end

  def invalid
    "Sorry, you do not have enough funds to donate. Your funds: $#{user.funds}"
  end

end
