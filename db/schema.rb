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

ActiveRecord::Schema.define(version: 2018_07_08_042634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comics", force: :cascade do |t|
    t.string "title", null: false
    t.string "title_kana", null: false
    t.string "title_en", null: false
    t.string "initial_char"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "impressions_count", default: 0, null: false
    t.index ["title"], name: "index_comics_on_title"
    t.index ["title_en"], name: "index_comics_on_title_en"
    t.index ["title_kana"], name: "index_comics_on_title_kana"
  end

  create_table "emotions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "impressions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "comic_title"
    t.text "report"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "capture"
    t.float "evaluation_point", default: 0.0, null: false
    t.integer "comic_volume"
    t.bigint "comic_id"
    t.index ["comic_id"], name: "index_impressions_on_comic_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "selecting_emotions", force: :cascade do |t|
    t.bigint "impression_id"
    t.bigint "emotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emotion_id"], name: "index_selecting_emotions_on_emotion_id"
    t.index ["impression_id"], name: "index_selecting_emotions_on_impression_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "avater"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.string "access_token_secret"
    t.string "slug"
  end

  add_foreign_key "impressions", "comics"
  add_foreign_key "selecting_emotions", "emotions"
  add_foreign_key "selecting_emotions", "impressions"
end
