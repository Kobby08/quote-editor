class LineItemDate < ApplicationRecord
  # vaidations
  validates_presence_of :date
  validates_uniqueness_of :date, scope: :quote_id

  # associations
  belongs_to :quote
  has_many :line_items, dependent: :destroy

  # scopes
  scope :ordered, -> { order(date: :asc) }

  # public interface
  def previous_date
    quote.line_item_dates.ordered.where('date < ?', date).last
  end
end
