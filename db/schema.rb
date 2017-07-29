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

ActiveRecord::Schema.define(version: 20170726134738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_plans", force: :cascade do |t|
    t.datetime "term_from"
    t.datetime "term_to"
    t.integer "target"
    t.integer "achievement"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_action_plans_on_schedule_id"
    t.index ["user_id"], name: "index_action_plans_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "term_from"
    t.datetime "term_to"
    t.integer "target"
    t.integer "achievement"
    t.text "body"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "action_plan_id"
    t.index ["action_plan_id"], name: "index_schedules_on_action_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "action_plan_id"
    t.index ["action_plan_id"], name: "index_users_on_action_plan_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "action_plans", "schedules"
  add_foreign_key "action_plans", "users"
  add_foreign_key "schedules", "action_plans"
  add_foreign_key "users", "action_plans"
end
