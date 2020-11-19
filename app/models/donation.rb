class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :species

  def add_donation
    if user.funds >= amount
      user.funds -= amount
      user.save
      "Thanks for donating $#{amount} to #{species.name}"
    else
      "Sorry, you do not have enough funds to donate. Your funds: #{user.funds}"
    end
  end
  
end
