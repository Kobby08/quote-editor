class LineItem < ApplicationRecord
  # associations
  belongs_to :line_item_date

  # validations
  validates_presence_of :name
  validates_numericality_of :quantity, greater_than: 0, only_integer: true
  validates_numericality_of :unit_price, greater_than: 0

  # interface
  delegate :quote, to: :line_item_date
end
