class Animal < ApplicationRecord
  belongs_to :species
  belongs_to :exhibit

  validates :name, presence: true

  # Todo Validations:
  # age no non numbers, presence
  # weight no non numbers, presence
  # description length 500
  # exhibit_id & species_id  presence
end
