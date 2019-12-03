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

ActiveRecord::Schema.define(version: 2019_12_03_123813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.string "description"
    t.float "amount"
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "selected"
    t.datetime "starting_date"
    t.integer "duration"
    t.boolean "reviewed"
    t.string "stripe_charge_id"
    t.index ["job_id"], name: "index_bids_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.text "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "status"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text"
    t.integer "rating"
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "worker_id"
    t.index ["job_id"], name: "index_reviews_on_job_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "bid_created", default: true
    t.boolean "bid_accepted", default: true
    t.boolean "job_created", default: true
    t.boolean "job_edited", default: true
    t.boolean "job_deleted", default: true
    t.boolean "job_started", default: true
    t.boolean "job_completed", default: true
    t.boolean "job_cancelled", default: true
    t.boolean "review_posted", default: true
    t.boolean "review_edited", default: true
    t.boolean "review_received", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "bid_reverted", default: true
    t.boolean "bid_updated", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "country"
    t.string "phone"
    t.string "aboutme"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "skill"
    t.boolean "admin", default: false
    t.string "stripe_user_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "jobs"
  add_foreign_key "reviews", "jobs"
end
