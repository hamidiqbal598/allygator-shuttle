class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :recorded_at
      t.string :angle
      t.string :direction
      t.float :distance
      t.references :vehicle, null: false, foreign_key: true
      t.timestamps
    end
    add_index :locations, :latitude
    add_index :locations, :longitude
    add_index :locations, :recorded_at
    add_index :locations, :angle
    add_index :locations, :direction
    add_index :locations, :distance
    add_index :locations, [:latitude, :longitude]
    add_index :locations, [:latitude, :longitude, :recorded_at]
  end
end
