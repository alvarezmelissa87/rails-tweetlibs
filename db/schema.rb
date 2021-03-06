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

ActiveRecord::Schema.define(version: 20140718001636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "original_stories", force: true do |t|
    t.string   "title"
    t.string   "genre"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.integer  "original_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genre"
    t.text     "content"
  end

  create_table "tweets", force: true do |t|
    t.string   "twitter_name1"
    t.string   "twitter_name2"
    t.string   "tweet_array1",     array: true
    t.string   "tweet_array2",     array: true
    t.string   "selected_tweets1", array: true
    t.string   "selected_tweets2", array: true
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
