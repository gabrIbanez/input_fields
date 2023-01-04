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

ActiveRecord::Schema[7.0].define(version: 2022_12_31_140434) do
  create_table "answers", force: :cascade do |t|
    t.integer "form_id", null: false
    t.json "data"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_answers_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "title"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "input_field_options", force: :cascade do |t|
    t.string "name"
    t.integer "input_field_id", null: false
    t.integer "position"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_field_id"], name: "index_input_field_options_on_input_field_id"
  end

  create_table "input_fields", force: :cascade do |t|
    t.string "type"
    t.integer "form_id", null: false
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hint", default: ""
    t.boolean "required", default: false
    t.string "label"
    t.integer "position"
    t.string "slug"
    t.index ["form_id"], name: "index_input_fields_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "forms"
  add_foreign_key "forms", "users"
  add_foreign_key "input_field_options", "input_fields"
  add_foreign_key "input_fields", "forms"
end
