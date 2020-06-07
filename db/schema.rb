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

ActiveRecord::Schema.define(version: 2020_06_06_045241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "consult_id"
    t.bigint "doctor_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consult_id"], name: "index_answers_on_consult_id"
    t.index ["doctor_id"], name: "index_answers_on_doctor_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.text "body"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_bills_on_doctor_id"
    t.index ["patient_id"], name: "index_bills_on_patient_id"
  end

  create_table "consults", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.bigint "speciality_id"
    t.string "subject"
    t.text "symptoms"
    t.integer "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_consults_on_doctor_id"
    t.index ["patient_id"], name: "index_consults_on_patient_id"
    t.index ["speciality_id"], name: "index_consults_on_speciality_id"
  end

  create_table "d_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "doctor_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_d_services_on_doctor_id"
    t.index ["service_id"], name: "index_d_services_on_service_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "license"
    t.bigint "speciality_id"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cellphone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "lastname"
    t.datetime "birth"
    t.string "email", default: "", null: false
    t.text "allergy"
    t.text "chronic_diseases"
    t.text "surgeries"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cellphone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "consults"
  add_foreign_key "answers", "doctors"
  add_foreign_key "bills", "doctors"
  add_foreign_key "bills", "patients"
  add_foreign_key "consults", "doctors"
  add_foreign_key "consults", "patients"
  add_foreign_key "consults", "specialities"
  add_foreign_key "d_services", "doctors"
  add_foreign_key "d_services", "services"
end
