class User < ApplicationRecord
  has_secure_password

  has_many :donations
  has_many :species, through: :donations

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :name, presence: true
  validates :funds, numericality: {greater_than: -1}
  validates :birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future

  scope :zookeepers, -> { where(admin: true)}

  def birthdate_cannot_be_in_the_future
    if birthdate > Date.today
      errors.add(:birthdate, "can't be in the future")
    end
  end 

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.name = auth_hash["info"]["name"]
      user.funds = 100
    end
  end 

  def self.most_donations
    donation_amounts = Donation.group(:user_id).count
    user_id = donation_amounts.key(donation_amounts.values.max)
    User.find_by_id(user_id)
  end

  def average_donation
    donations.average(:amount).to_i
  end

  def total_donations_by_species(species)
    self.donations.where("species_id = #{species.id}").sum(:amount)
  end

  def birthdate_to_string
    self.birthdate.strftime(" %B %e, %Y")
  end
end
