class Animal < ApplicationRecord
  belongs_to :species
  belongs_to :exhibit
end
