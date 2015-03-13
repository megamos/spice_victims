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

ActiveRecord::Schema.define(version: 20150313155757) do

  create_table "links", force: :cascade do |t|
    t.string   "topic",                   limit: 40
    t.text     "info",                    limit: 100
    t.string   "url"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "cached_votes_total",                  default: 0
    t.integer  "cached_votes_score",                  default: 0
    t.integer  "cached_votes_up",                     default: 0
    t.integer  "cached_votes_down",                   default: 0
    t.integer  "cached_weighted_score",               default: 0
    t.integer  "cached_weighted_total",               default: 0
    t.float    "cached_weighted_average",             default: 0.0
    t.string   "category"
    t.integer  "victim_id"
  end

  add_index "links", ["cached_votes_down"], name: "index_links_on_cached_votes_down"
  add_index "links", ["cached_votes_score"], name: "index_links_on_cached_votes_score"
  add_index "links", ["cached_votes_total"], name: "index_links_on_cached_votes_total"
  add_index "links", ["cached_votes_up"], name: "index_links_on_cached_votes_up"
  add_index "links", ["cached_weighted_average"], name: "index_links_on_cached_weighted_average"
  add_index "links", ["cached_weighted_score"], name: "index_links_on_cached_weighted_score"
  add_index "links", ["cached_weighted_total"], name: "index_links_on_cached_weighted_total"
  add_index "links", ["category"], name: "index_links_on_category"
  add_index "links", ["victim_id"], name: "index_links_on_victim_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "victim_relation",        default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "victims", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "country"
    t.string   "city"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "info"
    t.string   "category"
  end

  add_index "victims", ["category"], name: "index_victims_on_category"
  add_index "victims", ["country"], name: "index_victims_on_country"
  add_index "victims", ["id"], name: "index_victims_on_id"
  add_index "victims", ["name"], name: "index_victims_on_name"

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
