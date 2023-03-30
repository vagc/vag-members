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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_102949) do
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
  end

  create_table "stickers", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "sticker_number"
    t.string "sticker_variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"member_number\"", name: "index_stickers_on_member_number", unique: true
    t.index ["member_id"], name: "index_stickers_on_member_id"
  end

  add_foreign_key "stickers", "members"
end
