class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :openhour
      t.text :reflink

      t.timestamps null: false
    end
  end
end
