class Company < ApplicationRecord
  # validations
  validates_presence_of :name

  # associations
  has_many :users, dependent: :destroy
  has_many :quotes, dependent: :destroy
end
