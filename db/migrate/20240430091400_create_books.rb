class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :title
      t.string :isbn
      t.integer :year

      t.timestamps
    end
  end
end
