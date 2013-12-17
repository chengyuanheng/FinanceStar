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

ActiveRecord::Schema.define(version: 20131215221356) do

  create_table "finance_management_customer_consumes", force: true do |t|
    t.string   "customer_id"
    t.string   "consume"
    t.string   "consume_type"
    t.string   "consume_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_management_customers", force: true do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "original_funds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_star_users_user_verify_codes", force: true do |t|
    t.string   "user_id"
    t.string   "code"
    t.boolean  "has_validate", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_star_users_users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.text     "password"
    t.text     "phone"
    t.integer  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
