class User < ApplicationRecord
  has_secure_password

  # Todo: Validations
  # Name: No numbers or symbols
  # Birthdate: Not after today's date
  # Funds: cannot be negative

  validates :username, presence: true
  validates :username, uniqueness: true
end
