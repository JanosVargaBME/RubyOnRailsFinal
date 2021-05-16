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

ActiveRecord::Schema.define(version: 2021_05_14_162937) do

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resources", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "item_id", null: false
    t.string "version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_resources_on_item_id"
  end

  create_table "semesters", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number"
    t.integer "credits"
    t.float "average"
    t.string "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "semestersubjects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.string "homework"
    t.string "labor"
    t.string "exam"
    t.string "mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["subject_id"], name: "index_semestersubjects_on_subject_id"
    t.index ["user_id"], name: "index_semestersubjects_on_user_id"
  end

  create_table "subjects", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "credit"
    t.string "semester"
    t.string "tipus"
    t.string "mandatory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "salt"
  end

  add_foreign_key "resources", "items"
  add_foreign_key "semestersubjects", "subjects"
  add_foreign_key "semestersubjects", "users"
end
