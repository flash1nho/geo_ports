# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160810113857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ports", force: true do |t|
    t.string   "title",      null: false
    t.float    "lat",        null: false
    t.float    "lng",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "positions" because of following StandardError
#   Unknown type 'positions_enum_type' for column 'type'

  Foreigner.load
  add_foreign_key "positions", "ports", name: "positions_port_id_fk"

end
