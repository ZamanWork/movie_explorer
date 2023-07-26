class Movie < ApplicationRecord

  validates :title, presence: true
  validates_numericality_of :release_year, only_integer: true

  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

end
