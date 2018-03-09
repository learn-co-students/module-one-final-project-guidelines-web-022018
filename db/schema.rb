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

ActiveRecord::Schema.define(version: 3) do

  create_table "games", force: :cascade do |t|
    t.string "home_team"
    t.string "away_team"
    t.datetime "date"
  end

  create_table "players", force: :cascade do |t|
    t.string "full_name"
    t.string "team"
  end

  create_table "players_stats", force: :cascade do |t|
    t.integer "game_number"
    t.string "date"
    t.string "name"
    t.string "team"
    t.string "opponent"
    t.float "projected_pts"
    t.integer "actual_pts"
    t.float "projected_reb"
    t.integer "actual_reb"
    t.float "projected_ast"
    t.integer "actual_ast"
    t.float "projected_tov"
    t.integer "actual_tov"
    t.float "projected_stl"
    t.integer "actual_stl"
    t.float "projected_blk"
    t.integer "actual_blk"
    t.float "projected_fg3a"
    t.integer "actual_fg3a"
    t.float "projected_pf"
    t.integer "actual_pf"
    t.float "projected_fgm"
    t.integer "actual_fgm"
    t.float "projected_fga"
    t.integer "actual_fga"
    t.float "projected_oreb"
    t.integer "actual_oreb"
    t.float "projected_fta"
    t.integer "actual_fta"
    t.integer "game_id"
    t.integer "player_id"
  end

end
