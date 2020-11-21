class Exhibit < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :species, through: :animals

  validates :name, presence: true
  validates :name, uniqueness: true

  # Todo validations
  # Biome no non-letters
  # Description max length 500
end
