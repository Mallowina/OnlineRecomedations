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

ActiveRecord::Schema[7.1].define(version: 2023_10_31_102132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultation_request", id: :serial, force: :cascade do |t|
    t.integer "id_patient", null: false
    t.text "text_request", null: false
    t.date "date_of_create"
  end

  create_table "doctor", id: :integer, default: nil, force: :cascade do |t|
    t.string "last_name", limit: 255, null: false
    t.string "first_name", limit: 255, null: false
    t.string "patronymic", limit: 255, null: false
    t.string "specialization", limit: 255
  end

  create_table "patient", id: :integer, default: nil, force: :cascade do |t|
    t.string "last_name", limit: 255, null: false
    t.string "first_name", limit: 255, null: false
    t.string "patronymic", limit: 255, null: false
    t.date "date_of_birth"
    t.string "tel", limit: 25, null: false
    t.string "email", limit: 255
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendation", id: false, force: :cascade do |t|
    t.integer "id_consultation_request", null: false
    t.integer "id_doctor", null: false
    t.text "text_request", null: false
  end

  add_foreign_key "consultation_request", "patient", column: "id_patient", name: "consultation_request_id_patient_fkey", on_delete: :cascade
  add_foreign_key "recommendation", "consultation_request", column: "id_consultation_request", name: "recommendation_id_consultation_request_fkey", on_delete: :cascade
end
