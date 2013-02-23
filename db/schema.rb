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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130223043958) do

  create_table "parks", :force => true do |t|
    t.string   "name"
    t.string   "classification"
    t.string   "address"
    t.decimal  "gis_ac"
    t.integer  "zip_code"
    t.integer  "pavilions"
    t.integer  "playgrounds"
    t.integer  "picnic_shelters"
    t.integer  "gazebos"
    t.integer  "picnic_tables"
    t.integer  "grills"
    t.integer  "restrooms"
    t.integer  "parking_spaces"
    t.integer  "ball_fields"
    t.integer  "soccer_fields"
    t.integer  "tennis_courts"
    t.integer  "basketball_courts"
    t.integer  "volleyball_courts"
    t.boolean  "pool"
    t.boolean  "gym"
    t.boolean  "recreation_center"
    t.boolean  "covbb"
    t.boolean  "dog_park"
    t.boolean  "track"
    t.boolean  "nat"
    t.boolean  "golf"
    t.decimal  "area"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
