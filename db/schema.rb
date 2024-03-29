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

ActiveRecord::Schema.define(version: 20121217011100) do

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "yearbook_id"
    t.integer  "assignable_id"
    t.string   "assignable_type"
    t.boolean  "completed"
    t.datetime "completed_at"
    t.boolean  "approved"
    t.integer  "approved_by"
    t.datetime "approved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"
  add_index "assignments", ["yearbook_id"], name: "index_assignments_on_yearbook_id"

  create_table "deadlines", force: true do |t|
    t.integer  "yearbook_id"
    t.string   "title"
    t.text     "description"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deadlines", ["yearbook_id"], name: "index_deadlines_on_yearbook_id"

  create_table "events", force: true do |t|
    t.integer  "yearbook_id"
    t.string   "title"
    t.text     "details"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "spread_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "subdomain"
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "yearbook_id"
    t.integer  "deadline_id"
    t.string   "title"
    t.string   "color"
    t.integer  "pages"
    t.integer  "section_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["yearbook_id"], name: "index_sections_on_yearbook_id"

  create_table "sections_users", force: true do |t|
    t.integer "section_id"
    t.integer "user_id"
  end

  create_table "spreads", force: true do |t|
    t.integer  "section_id"
    t.integer  "deadline_id"
    t.integer  "left_page_id"
    t.integer  "right_page_id"
    t.string   "title"
    t.text     "description"
    t.integer  "spread_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spreads", ["section_id"], name: "index_spreads_on_section_id"

  create_table "users", force: true do |t|
    t.integer  "school_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "users_yearbooks", force: true do |t|
    t.integer "user_id"
    t.integer "yearbook_id"
  end

  create_table "yearbooks", force: true do |t|
    t.integer  "school_id"
    t.boolean  "current",       default: false
    t.integer  "starting_year"
    t.integer  "ending_year"
    t.string   "theme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
