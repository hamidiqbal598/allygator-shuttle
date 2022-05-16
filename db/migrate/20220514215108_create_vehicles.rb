class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :route, :default => ""
      t.string :destination, :default => ""
      t.boolean :status, :default => true
      t.string :uid, :null => false, :default => ""
      t.references :station, null: false, foreign_key: true
      t.timestamps
    end
    add_index :vehicles, :route
    add_index :vehicles, :destination
    add_index :vehicles, :status
    add_index :vehicles, :uid
  end
end
