class Species < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  # Todo validations
  # common_name no non letters
  # conservation status presence
  # description length 500
end