class User < ApplicationRecord
  has_secure_password

  # Todo: Validations
  # Username: presence, uniqueness
  # Name: No numbers or symbols
  # Birthdate: Not after today's date
  # Funds: cannot be negative
end
