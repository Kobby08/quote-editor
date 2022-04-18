class LineItemDate < ApplicationRecord
  # vaidations
  validates_presence_of :date
  validates_uniqueness_of :date, scope: :quote_id

  # associations
  belongs_to :quote

  # scopes
  scope ordered: -> { order(date: :asc) }
end
