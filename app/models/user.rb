class User < ApplicationRecord
  # devise modules
  devise :database_authenticatable, :validatable

  # associations
  belongs_to :company
end
