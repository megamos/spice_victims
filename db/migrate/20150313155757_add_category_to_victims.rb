class AddCategoryToVictims < ActiveRecord::Migration
  def change
    add_column :victims, :category, :string
    add_index :victims, :category
  end
end
