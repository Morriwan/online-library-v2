class ChangeFirstNameToNameFromAuthors < ActiveRecord::Migration[7.1]
  def change
    rename_column :authors, :first_name, :name
  end
end
