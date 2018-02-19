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

ActiveRecord::Schema.define(version: 20180203075456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id"
    t.bigint "zone_id"
    t.hstore "coords"
    t.string "name"
    t.index ["map_id"], name: "index_cities_on_map_id"
    t.index ["zone_id"], name: "index_cities_on_zone_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id"
    t.bigint "city_id"
    t.integer "connected_city_id"
    t.index ["city_id"], name: "index_connections_on_city_id"
    t.index ["map_id"], name: "index_connections_on_map_id"
  end

  create_table "game_actions", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "values"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_game_actions_on_user_id"
    t.index ["values"], name: "index_game_actions_on_values", using: :gin
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id"
    t.index ["map_id"], name: "index_games_on_map_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name", null: false
    t.integer "published_version"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.string "modules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "sequence"
    t.boolean "current_player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stats", force: :cascade do |t|
    t.integer "games_won"
    t.integer "games_lost"
    t.string "current_state"
    t.integer "current_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.text "cities", default: [], array: true
    t.text "zones", default: [], array: true
    t.text "connections", default: [], array: true
    t.string "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id"
    t.string "name"
    t.index ["map_id"], name: "index_zones_on_map_id"
  end

end
