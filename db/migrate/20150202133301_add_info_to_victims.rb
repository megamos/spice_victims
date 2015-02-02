class AddInfoToVictims < ActiveRecord::Migration
  def change
    add_column :victims, :info, :text
  end
end
