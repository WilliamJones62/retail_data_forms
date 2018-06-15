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

ActiveRecord::Schema.define(version: 20180615130227) do

  create_table "altcsrs", force: :cascade do |t|
    t.string "usualcsr"
    t.string "altcsr"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "day"
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
    t.boolean "dontcall"
    t.text "reason"
    t.date "startdc"
    t.date "enddc"
    t.boolean "special"
    t.date "starts"
    t.date "ends"
    t.string "altrep"
    t.date "startar"
    t.date "endar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dontcalls", force: :cascade do |t|
    t.string "customer"
    t.string "shipto"
    t.string "part"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "onspecials", force: :cascade do |t|
    t.string "customer"
    t.string "part"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
