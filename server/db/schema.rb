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

ActiveRecord::Schema.define(version: 2019_10_27_001540) do

  create_table "links", force: :cascade do |t|
    t.integer "user_id"
    t.integer "media_platform_id"
    t.string "url", null: false
    t.index ["media_platform_id"], name: "index_links_on_media_platform_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "media_platforms", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nick_name"
    t.string "img"
    t.string "qr"
    t.string "comment"
  end

end
