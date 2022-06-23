class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list, dependent: :destroy
  validates :comment, presence: true
  validates :movie, uniqueness: { scope: :list, message: "This movie already exists in this list" }
  validates :comment, length: { minimum: 6 }
end
