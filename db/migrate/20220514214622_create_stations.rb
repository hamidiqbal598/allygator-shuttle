class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.float :latitude
      t.float :longitude
      t.string :name, default: ""
      t.float :radius, default: 0.0
      t.timestamps
    end
    add_index :stations, :latitude
    add_index :stations, :longitude
    add_index :stations, :name
    add_index :stations, :radius
    add_index :stations, [:latitude, :longitude]
    add_index :stations, [:latitude, :longitude, :radius]
  end
end
