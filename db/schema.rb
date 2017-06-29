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

ActiveRecord::Schema.define(version: 20170629032015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercises", ["name"], name: "index_exercises_on_name", unique: true, using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "exercise_id",                 null: false
    t.integer  "workout_id",                  null: false
    t.integer  "weight"
    t.integer  "reps"
    t.integer  "time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "completed?",  default: false
  end

  add_index "logs", ["exercise_id"], name: "index_logs_on_exercise_id", using: :btree
  add_index "logs", ["workout_id"], name: "index_logs_on_workout_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "exercise_id", null: false
    t.integer  "max_weight"
    t.integer  "max_reps"
    t.integer  "max_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "records", ["exercise_id"], name: "index_records_on_exercise_id", using: :btree
  add_index "records", ["user_id", "exercise_id"], name: "index_records_on_user_id_and_exercise_id", unique: true, using: :btree
  add_index "records", ["user_id"], name: "index_records_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "height"
    t.integer  "weight"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "session_token"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "completed?", default: false, null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "workouts", ["name", "user_id"], name: "index_workouts_on_name_and_user_id", unique: true, using: :btree
  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

end
