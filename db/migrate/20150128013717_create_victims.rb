class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.string :city
      t.string :link

      t.timestamps null: false
    end
  end
end
