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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140122190709) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "post_id",    :null => false
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "friend_requests", :force => true do |t|
    t.integer  "user_from_id", :null => false
    t.integer  "user_to_id",   :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "friend_requests", ["user_from_id", "user_to_id"], :name => "index_friend_requests_on_user_from_id_and_user_to_id", :unique => true
  add_index "friend_requests", ["user_from_id"], :name => "index_friend_requests_on_user_from_id"
  add_index "friend_requests", ["user_to_id"], :name => "index_friend_requests_on_user_to_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_from_id", :null => false
    t.integer  "user_to_id",   :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "friendships", ["user_from_id", "user_to_id"], :name => "index_friendships_on_user_from_id_and_user_to_id", :unique => true
  add_index "friendships", ["user_from_id"], :name => "index_friendships_on_user_from_id"
  add_index "friendships", ["user_to_id"], :name => "index_friendships_on_user_to_id"

  create_table "pictures", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "pic_file_file_name"
    t.string   "pic_file_content_type"
    t.integer  "pic_file_file_size"
    t.datetime "pic_file_updated_at"
  end

  add_index "pictures", ["user_id"], :name => "index_pictures_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "private_messages", :force => true do |t|
    t.integer  "user_from_id", :null => false
    t.integer  "user_to_id",   :null => false
    t.text     "body",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "private_messages", ["user_from_id"], :name => "index_private_messages_on_user_from_id"
  add_index "private_messages", ["user_to_id"], :name => "index_private_messages_on_user_to_id"

  create_table "users", :force => true do |t|
    t.string   "email",                    :null => false
    t.string   "name",                     :null => false
    t.string   "password_digest",          :null => false
    t.string   "session_token",            :null => false
    t.string   "gender",                   :null => false
    t.date     "birthday",                 :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
