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

ActiveRecord::Schema.define(version: 5) do

  create_table "movies", force: :cascade do |t|
    t.string "name"
  end

  create_table "nominations", force: :cascade do |t|
    t.string  "category_name"
    t.integer "year"
    t.integer "win"
    t.integer "nominee_id"
    t.integer "movie_id"
    t.integer "ceremony"
  end

  create_table "nominees", force: :cascade do |t|
    t.string "name"
  end

end
