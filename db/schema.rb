# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_21_205805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "day", null: false
    t.string "hour", null: false
    t.string "link", null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["link", "user_id", "category_id"], name: "index_events_on_link_and_user_id_and_category_id", unique: true
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_preferences_on_category_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "email", default: "", null: false
    t.string "avatar_profile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.bigint "preference_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.date "date", null: false
    t.string "link", null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["link", "user_id", "category_id"], name: "index_videos_on_link_and_user_id_and_category_id", unique: true
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "preferences", "categories"
  add_foreign_key "videos", "categories"
  add_foreign_key "videos", "users"
end
