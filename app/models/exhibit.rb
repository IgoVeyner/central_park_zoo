class Exhibit < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  # Todo validations
  # Biome no non-letters
  # Description max length 500
end
