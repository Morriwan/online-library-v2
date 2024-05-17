class DropGenre < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :books, :genres
    drop_table :genres
  end
end
