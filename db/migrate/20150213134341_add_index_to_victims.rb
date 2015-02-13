class AddIndexToVictims < ActiveRecord::Migration
  def change
    add_index :victims, :id
  end
end
