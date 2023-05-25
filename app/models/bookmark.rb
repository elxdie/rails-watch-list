class Bookmark < ApplicationRecord
  # belongs to a movie and a list
  belongs_to :movie
  belongs_to :list

  # movie & list cannot be blank
  # is unique for a given movie/list couple
  validates :movie, uniqueness: { scope: :list }

  # comment cannot be shorter than 6 characters
  validates :comment, length: { minimum: 6 }
end
