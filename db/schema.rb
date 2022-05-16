# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_14_220347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "recorded_at"
    t.string "angle"
    t.string "direction"
    t.float "distance"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["angle"], name: "index_locations_on_angle"
    t.index ["direction"], name: "index_locations_on_direction"
    t.index ["distance"], name: "index_locations_on_distance"
    t.index ["latitude", "longitude", "recorded_at"], name: "index_locations_on_latitude_and_longitude_and_recorded_at"
    t.index ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude"
    t.index ["latitude"], name: "index_locations_on_latitude"
    t.index ["longitude"], name: "index_locations_on_longitude"
    t.index ["recorded_at"], name: "index_locations_on_recorded_at"
    t.index ["vehicle_id"], name: "index_locations_on_vehicle_id"
  end

  create_table "stations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name", default: ""
    t.float "radius", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latitude", "longitude", "radius"], name: "index_stations_on_latitude_and_longitude_and_radius"
    t.index ["latitude", "longitude"], name: "index_stations_on_latitude_and_longitude"
    t.index ["latitude"], name: "index_stations_on_latitude"
    t.index ["longitude"], name: "index_stations_on_longitude"
    t.index ["name"], name: "index_stations_on_name"
    t.index ["radius"], name: "index_stations_on_radius"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "route", default: ""
    t.string "destination", default: ""
    t.boolean "status", default: true
    t.string "uid", default: "", null: false
    t.bigint "station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination"], name: "index_vehicles_on_destination"
    t.index ["route"], name: "index_vehicles_on_route"
    t.index ["station_id"], name: "index_vehicles_on_station_id"
    t.index ["status"], name: "index_vehicles_on_status"
    t.index ["uid"], name: "index_vehicles_on_uid"
  end

  add_foreign_key "locations", "vehicles"
  add_foreign_key "vehicles", "stations"
end
