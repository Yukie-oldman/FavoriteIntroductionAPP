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

ActiveRecord::Schema.define(version: 2021_05_09_140624) do

  create_table "follow_tags", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_follow_tags_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "introduction_id"
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["introduction_id"], name: "index_images_on_introduction_id"
  end

  create_table "introductions", force: :cascade do |t|
    t.string "caption"
    t.string "name"
    t.string "contents"
    t.string "buf_tags"
    t.integer "good"
    t.string "image1_id"
    t.string "image2_id"
    t.string "image3_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_introductions_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "introduction_id"
    t.integer "voter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["introduction_id"], name: "index_likes_on_introduction_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "introduction_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["introduction_id"], name: "index_tags_on_introduction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.string "password_digest"
    t.string "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
