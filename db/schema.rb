# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160419214519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["dog_id"], name: "index_comments_on_dog_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "dogs", force: :cascade do |t|
    t.string   "handle"
    t.integer  "user_id"
    t.integer  "breed_id"
    t.string   "avatar_url"
    t.string   "name"
    t.text     "bio"
    t.integer  "sex"
    t.string   "website"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "dogs", ["breed_id"], name: "index_dogs_on_breed_id", using: :btree
  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hashtags", ["name"], name: "index_hashtags_on_name", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["dog_id"], name: "index_likes_on_dog_id", using: :btree
  add_index "likes", ["post_id", "dog_id"], name: "index_likes_on_post_id_and_dog_id", unique: true, using: :btree
  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree

  create_table "mentions", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mentions", ["dog_id"], name: "index_mentions_on_dog_id", using: :btree
  add_index "mentions", ["post_id", "dog_id"], name: "index_mentions_on_post_id_and_dog_id", unique: true, using: :btree
  add_index "mentions", ["post_id"], name: "index_mentions_on_post_id", using: :btree

  create_table "post_hashtags", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_hashtags", ["hashtag_id"], name: "index_post_hashtags_on_hashtag_id", using: :btree
  add_index "post_hashtags", ["post_id", "hashtag_id"], name: "index_post_hashtags_on_post_id_and_hashtag_id", unique: true, using: :btree
  add_index "post_hashtags", ["post_id"], name: "index_post_hashtags_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "image_url"
    t.text     "caption"
    t.json     "location"
    t.integer  "dog_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "posts", ["dog_id"], name: "index_posts_on_dog_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followee_id"], name: "index_relationships_on_followee_id", using: :btree
  add_index "relationships", ["follower_id", "followee_id"], name: "index_relationships_on_follower_id_and_followee_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "comments", "dogs"
  add_foreign_key "comments", "posts"
  add_foreign_key "dogs", "breeds"
  add_foreign_key "dogs", "users"
  add_foreign_key "posts", "dogs"
end
