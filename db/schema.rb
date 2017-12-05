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

ActiveRecord::Schema.define(version: 20171205202120) do

  create_table "comittees", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "committee_members", force: :cascade do |t|
    t.integer "committee_id"
    t.integer "congressman_id"
  end

  create_table "congressmen", force: :cascade do |t|
    t.string "short_title"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "api_uri"
    t.string "api_id"
    t.integer "party"
    t.string "leadership_role"
    t.string "twitter_account"
    t.string "facebook_account"
    t.string "youtube_account"
    t.string "url"
    t.string "contact_form"
    t.boolean "in_office"
    t.datetime "next_election"
    t.integer "total_votes"
    t.integer "missed_votes"
    t.string "office_address"
    t.string "phone"
    t.string "fax"
    t.string "state"
    t.string "state_rank"
    t.float "votes_with_party_pct"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
  end

end
