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

ActiveRecord::Schema.define(version: 20180303203644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "legislators", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "official_name"
    t.string "birthday"
    t.string "gender"
    t.string "twitter"
    t.string "youtube"
    t.string "instagram"
    t.string "facebook"
    t.string "wikipedia"
    t.string "thomas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thomas_id"], name: "index_legislators_on_thomas_id", unique: true
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_parties_on_name", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_states_on_code", unique: true
  end

  create_table "terms", force: :cascade do |t|
    t.integer "legislator_id"
    t.integer "party_id"
    t.integer "state_id"
    t.date "start_date"
    t.date "end_date"
    t.string "type"
    t.string "district"
    t.string "url"
    t.string "address"
    t.string "phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legislator_id"], name: "index_terms_on_legislator_id"
    t.index ["party_id"], name: "index_terms_on_party_id"
    t.index ["state_id"], name: "index_terms_on_state_id"
  end

end
