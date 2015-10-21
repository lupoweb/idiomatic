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

ActiveRecord::Schema.define(version: 20151008120907) do

  create_table "languages", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.boolean  "enabled",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "languages", ["code"], name: "index_languages_on_code", using: :btree

  create_table "words", force: :cascade do |t|
    t.integer  "language_id", limit: 4
    t.string   "label",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["language_id", "label"], name: "index_words_on_language_id_and_label", unique: true, using: :btree
  add_index "words", ["language_id"], name: "index_words_on_language_id", using: :btree

  add_foreign_key "words", "languages"
end
