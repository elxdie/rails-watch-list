class List < ApplicationRecord
  # has many bookmarks
  # should destroy child saved movies when destroying self
  has_many :bookmarks, dependent: :destroy
  # has many movies through the bookmark as the table bookmark contains the id
  has_many :movies, through: :bookmarks

  # name cannot be blank
  validates :name, presence: true
  # name is unique
  validates :name, uniqueness: true
end
