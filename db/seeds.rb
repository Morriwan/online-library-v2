# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up database..."
Book.destroy_all
Author.destroy_all
Category.destroy_all
Genre.destroy_all
puts "Database cleaned up!"

puts "Creating library..."
author = Author.create!(first_name: "F. Scott", last_name: "Fitzgerald")
category = Category.create!(name: "Fiction")
genre = Genre.create!(name: "Classic")
Book.create!(
  name: "The Great Gatsby",
  isbn: "9780743273565",
  year: 1925,
  author: author,
  category: category,
  genre: genre
)

puts "Library created!"
