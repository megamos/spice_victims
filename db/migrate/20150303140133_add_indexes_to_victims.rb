class AddIndexesToVictims < ActiveRecord::Migration
  def change
    add_index :victims, :country
    add_index :victims, :name
  end
end
