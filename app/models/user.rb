class User < ApplicationRecord
  # devise modules
  devise :database_authenticatable, :validatable

  # associations
  belongs_to :company

  # public interface
  def name
    email.split('@').first.capitalize
  end
end
