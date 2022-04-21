class LineItem < ApplicationRecord
  # associations
  belongs_to :line_item_date

  # validations
  validates_presence_of :name
  validates_numericality_of :quantity, greater_than: 0, only_integer: true
  validates_numericality_of :unit_price, greater_than: 0

  # interfaces
  delegate :quote, to: :line_item_date

  def total_price
    quantity * unit_price
  end
end
