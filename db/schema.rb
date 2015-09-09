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

ActiveRecord::Schema.define(version: 20150908072943) do

  create_table "comments", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "done",                   default: false
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "group_comments", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.boolean  "done",                      default: false
    t.integer  "group_id",      limit: 4
    t.integer  "group_post_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "group_comments", ["group_id"], name: "index_group_comments_on_group_id", using: :btree
  add_index "group_comments", ["group_post_id"], name: "index_group_comments_on_group_post_id", using: :btree

  create_table "group_post_comments", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.boolean  "done",                      default: false
    t.integer  "group_post_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "group_post_comments", ["group_post_id"], name: "index_group_post_comments_on_group_post_id", using: :btree

  create_table "group_posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "done",                   default: false
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "group_posts", ["group_id"], name: "index_group_posts_on_group_id", using: :btree

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.boolean  "done",                 default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id",  limit: 4
    t.integer  "following_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "relationships", ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  add_index "relationships", ["following_id"], name: "index_relationships_on_following_id", using: :btree

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name", limit: 255
    t.integer  "source_id",       limit: 4
    t.string   "source_type",     limit: 255
    t.integer  "target_id",       limit: 4
    t.string   "target_type",     limit: 255
    t.float    "value",           limit: 24,    default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data",            limit: 65535
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4
    t.string   "sender_type", limit: 255
    t.integer  "receiver_id", limit: 4
    t.float    "weight",      limit: 24,  default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name", limit: 255
    t.float    "value",           limit: 24,    default: 0.0
    t.string   "aggregated_by",   limit: 255
    t.integer  "target_id",       limit: 4
    t.string   "target_type",     limit: 255
    t.boolean  "active",                        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data",            limit: 65535
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255, default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

