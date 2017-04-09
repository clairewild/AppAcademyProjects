# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170208181854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer "yr",       null: false
    t.string  "make",     null: false
    t.string  "model",    null: false
    t.integer "owner_id", null: false
    t.string  "color",    null: false
    t.index ["owner_id"], name: "index_cars_on_owner_id", using: :btree
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "renter_id",  null: false
    t.integer  "car_id",     null: false
    t.datetime "start_date", null: false
    t.datetime "end_date",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_rentals_on_car_id", using: :btree
    t.index ["renter_id"], name: "index_rentals_on_renter_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

end
