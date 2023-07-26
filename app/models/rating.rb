class Rating < ApplicationRecord
  belongs_to :movie

  validates :value, presence: true
  validates_numericality_of :value, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
end
