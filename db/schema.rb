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

ActiveRecord::Schema.define(version: 20140627133610) do

  create_table "flight_times", force: true do |t|
    t.string   "flight"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.integer  "flight_ref"
    t.date     "flight_date"
    t.time     "time_tk_off"
    t.string   "flight_name"
    t.integer  "pax_blocked"
    t.integer  "seats"
    t.string   "flight_status"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flight_time_id"
  end

  create_table "paxes", force: true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "lieu_de_naissance"
    t.date     "date_de_naissance"
    t.boolean  "adulte"
    t.boolean  "enfant"
    t.text     "observations"
    t.integer  "flight_id"
    t.integer  "resa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resas", force: true do |t|
    t.string   "refresa"
    t.datetime "demand"
    t.string   "duree"
    t.integer  "paxa"
    t.integer  "paxe"
    t.string   "vente"
    t.string   "nom"
    t.string   "telephone"
    t.string   "email"
    t.text     "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flight_id"
    t.integer  "flight_time_id"
    t.string   "heure_demand"
  end

end
