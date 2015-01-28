class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :topic, limit: 40
      t.text :info, limit: 100
      t.string :link

      t.timestamps null: false
    end
  end
end
