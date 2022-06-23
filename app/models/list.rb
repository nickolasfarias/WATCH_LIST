class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :movies, through: :bookmarks
  validates :name, presence: true
  validates :name, uniqueness: true
end
