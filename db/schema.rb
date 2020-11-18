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

ActiveRecord::Schema.define(version: 2020_11_18_205519) do

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "weight"
    t.string "image_url", default: "https://www.drupal.org/files/issues/2019-07-21/missing.png"
    t.string "description"
    t.integer "exhibit_id"
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibits", force: :cascade do |t|
    t.string "name"
    t.string "biome"
    t.string "image_url", default: "https://www.drupal.org/files/issues/2019-07-21/missing.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "common_name"
    t.string "conservation_status"
    t.string "image_url", default: "https://www.drupal.org/files/issues/2019-07-21/missing.png"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.datetime "birthdate"
    t.integer "funds"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
