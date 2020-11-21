class Exhibit < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :species, through: :animals

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :biome, presence: true
  validates :description, length: { maximum: 500 }
 
end
