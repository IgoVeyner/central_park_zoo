class Species < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :exhibits, through: :animals
  has_many :donations, dependent: :destroy
  has_many :users, through: :donations

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :conservation_status, presence: true
  validates :description, length: { maximum: 500 }

  def top_donor
    donation_totals_by_user = donations.group(:user_id).sum(:amount)
    user_id = donation_totals_by_user.key(donation_totals_by_user.values.max)
    User.find_by_id(user_id)
  end
end
