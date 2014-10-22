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

ActiveRecord::Schema.define(version: 20141021193439) do

  create_table "cared_objects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "cared_objects", ["team_id"], name: "index_cared_objects_on_team_id"

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.datetime "noted_at"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cared_object_id"
  end

  add_index "notes", ["cared_object_id"], name: "index_notes_on_cared_object_id"

  create_table "tasks", force: true do |t|
    t.text     "task"
    t.boolean  "completed"
    t.text     "notes"
    t.datetime "completed_at"
    t.datetime "deadline"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cared_object_id"
    t.integer  "claimed_id"
  end

  add_index "tasks", ["cared_object_id"], name: "index_tasks_on_cared_object_id"

  create_table "teams", force: true do |t|
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cared_object_id"
  end

  add_index "teams", ["cared_object_id"], name: "index_teams_on_cared_object_id"

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
