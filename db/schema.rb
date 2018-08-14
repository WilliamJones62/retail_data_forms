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

ActiveRecord::Schema.define(version: 20180813205542) do

  create_table "altcsrs", force: :cascade do |t|
    t.string "usualcsr"
    t.string "altcsr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "altcrs_start"
    t.date "altcrs_end"
    t.string "shipto"
    t.string "altcsrs_day"
    t.string "custcode"
  end

  create_table "authorlists", force: :cascade do |t|
    t.string "partcode"
    t.string "dept"
    t.string "custcode"
    t.integer "turns"
    t.integer "seq"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calllists", force: :cascade do |t|
    t.string "custname"
    t.string "custcode"
    t.string "shipto"
    t.string "rep"
    t.string "csr"
    t.string "dept"
    t.string "item"
    t.string "phone"
    t.string "manager"
    t.integer "totalitems"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "calllists_day"
    t.boolean "called"
    t.date "called_date"
    t.boolean "ordered"
    t.string "notes"
    t.string "callback_day"
    t.date "callback_date"
    t.string "instructions"
  end

  create_table "dontcalls", force: :cascade do |t|
    t.string "customer"
    t.string "shipto"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dontcalls_start"
    t.date "dontcalls_end"
  end

  create_table "onspecials", force: :cascade do |t|
    t.string "customer"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "onspecials_start"
    t.date "onspecials_end"
  end

  create_table "shiptos", force: :cascade do |t|
    t.string "shipto_code"
    t.string "route_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
