class Species < ApplicationRecord
  has_many :animals
  has_many :exhibits, through: :animals
  has_many :donations
  has_many :users, through: :donations

  validates :name, presence: true
  validates :name, uniqueness: true

  # Todo validations
  # common_name no non letters
  # conservation status presence
  # description length 500
end
