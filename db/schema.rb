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

ActiveRecord::Schema.define(version: 20160216000215) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",                  limit: 255
    t.string   "second_name",                 limit: 255
    t.string   "last_name",                   limit: 255
    t.string   "second_last_name",            limit: 255
    t.string   "principal_phone",             limit: 255
    t.string   "cellphone",                   limit: 255
    t.string   "email",                       limit: 255
    t.date     "birth"
    t.string   "address",                     limit: 255
    t.string   "postal_code",                 limit: 255
    t.string   "city",                        limit: 255
    t.string   "state",                       limit: 255
    t.string   "emergency_contact_full_name", limit: 255
    t.string   "emergency_contact_address",   limit: 255
    t.string   "emergency_contact_phone",     limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "package_dimentions",   limit: 255
    t.string   "package_weight",       limit: 255
    t.string   "safeguard_time",       limit: 255
    t.string   "outbound_packet_time", limit: 255
    t.string   "entry_packet_time",    limit: 255
    t.string   "batch_number",         limit: 255
    t.integer  "client_id",            limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "packages", ["client_id"], name: "index_packages_on_client_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "packages", "clients"
end
