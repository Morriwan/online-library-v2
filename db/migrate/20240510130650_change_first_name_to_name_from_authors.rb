class ChangeFirstNameToNameFromAuthors < ActiveRecord::Migration[7.1]
  def change
    change_column :authors, :first_name, :name
  end
end
