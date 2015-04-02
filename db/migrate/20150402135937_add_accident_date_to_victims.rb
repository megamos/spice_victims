class AddAccidentDateToVictims < ActiveRecord::Migration
  def change
    add_column :victims, :accident_date, :date
  end
end
