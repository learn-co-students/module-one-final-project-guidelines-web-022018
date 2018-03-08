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

ActiveRecord::Schema.define(version: 4) do

  create_table "beers", force: :cascade do |t|
    t.integer "apiid"
    t.string  "beername"
    t.string  "tagline"
    t.string  "description"
    t.integer "abv"
    t.integer "ibu"
    t.integer "target_fg"
    t.integer "target_og"
    t.integer "srm"
    t.integer "ph"
    t.integer "attenuation_level"
    t.string  "volume"
    t.string  "boil_volume"
    t.string  "method"
    t.string  "ingredients"
    t.string  "food_pairing"
    t.string  "brewers_tips"
    t.string  "contributed_by"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.string  "username"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
