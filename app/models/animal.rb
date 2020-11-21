class Animal < ApplicationRecord
  belongs_to :species
  belongs_to :exhibit

  validates :name, presence: true
  validates :age, presence: true
  validates :age, numericality: {greater_than: -1}
  validates :weight, presence: true
  validates :weight, numericality: {greater_than: -1}
  validates :description, length: { maximum: 500 }
  
end
