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

ActiveRecord::Schema.define(version: 20140317065452) do

  create_table "finance_management_customer_consumes", force: true do |t|
    t.string   "user_id"
    t.string   "customer_name"
    t.string   "consume"
    t.string   "consume_type"
    t.integer  "consume_value",    default: 0
    t.string   "consume_describe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_management_customers", force: true do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "original_funds", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_management_user_defined_consume_types", force: true do |t|
    t.string   "user_id"
    t.string   "consume"
    t.string   "consume_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_star_users_sms_records", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "phone"
    t.string   "has_send",   default: "f"
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
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
