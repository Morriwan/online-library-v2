class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books
  has_many :categories, through: :books
  validates :name, presence: true
end
