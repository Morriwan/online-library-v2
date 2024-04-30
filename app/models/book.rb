class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  belongs_to :genre
  validates :name, presence: true
  validates :isbn, presence: true
end
