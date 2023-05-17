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

ActiveRecord::Schema[7.0].define(version: 2023_05_16_132710) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "registered_time"
    t.string "name"
    t.string "car_registration"
    t.string "make"
    t.string "model"
    t.string "dob"
    t.string "phone_number"
    t.string "payment_code"
    t.string "email"
    t.string "emergency_contact"
    t.float "amount_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "member_number"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "stickers", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.integer "sticker_number"
    t.string "sticker_variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_code"
    t.datetime "discarded_at"
    t.boolean "collected"
    t.index ["discarded_at"], name: "index_stickers_on_discarded_at"
    t.index ["member_id"], name: "index_stickers_on_member_id"
  end

  add_foreign_key "stickers", "members"
end
