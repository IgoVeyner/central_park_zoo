class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :species

  private

  def add_donation
    if user.funds >= amount
      user.funds -= amount
      "Thanks for donating $#{amount} to #{species.name}"
    else
      "Sorry, you do not have enough funds to donate. Your funds: #{user.funds}"
    end
  end
  
end
