class Movie < ApplicationRecord
  has_many :bookmarks

  # title cannot be blank
  validates :title, presence: true
  # overview cannot be blank
  validates :overview, presence: true
  # title is unique
  validates :title, uniqueness: true
end
