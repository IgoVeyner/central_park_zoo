class User < ApplicationRecord
  has_secure_password

  # Todo: Validations
  # Name: No numbers or symbols
  # Birthdate: Not after today's date
  # Funds: cannot be negative

  validates :username, presence: true
  validates :username, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.name = auth_hash["info"]["name"]
      user.funds = 100
    end
  end
end
