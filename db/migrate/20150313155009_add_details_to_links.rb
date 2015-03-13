class AddDetailsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :category, :string
    add_index :links, :category
    add_reference :links, :victim, index: true
    add_foreign_key :links, :victims
  end
end
