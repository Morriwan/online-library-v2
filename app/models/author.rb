class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :genres, through: :books
  has_many :categories, through: :books
  validates :first_name, :last_name, presence: true
end
