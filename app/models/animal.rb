class Animal < ApplicationRecord
  belongs_to :species
  belongs_to :exhibit

  validates :name, presence: true
end
