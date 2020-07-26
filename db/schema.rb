# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_26_165653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payment_requests", force: :cascade do |t|
    t.string "recipient_name", null: false
    t.string "recipient_address", null: false
    t.string "recipient_zip", null: false
    t.string "recipient_city", null: false
    t.string "recipient_country", null: false
    t.string "sender_name", null: false
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.string "currency", null: false
    t.string "iban", null: false
    t.string "bic", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iban"], name: "index_payment_requests_on_iban"
  end

end
