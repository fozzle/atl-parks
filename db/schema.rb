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

ActiveRecord::Schema.define(:version => 20130413214108) do

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
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.decimal  "latitude",          :precision => 13, :scale => 10
    t.decimal  "longitude",         :precision => 13, :scale => 10
    t.text     "kml"
    t.integer  "paved_trails"
    t.integer  "unpaved_trails"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
