# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
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
    t.integer "user_id"
    t.string "name"
    t.string "caption"
    t.string "buf_tags"
    t.string "contents"
    t.string "image1"
    t.string "image2"
    t.string "image3"
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

  add_foreign_key "follow_tags", "users"
  add_foreign_key "images", "introductions"
  add_foreign_key "introductions", "users"
  add_foreign_key "likes", "introductions"
  add_foreign_key "tags", "introductions"
end
