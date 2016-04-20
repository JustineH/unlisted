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

ActiveRecord::Schema.define(version: 20160420173105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: true do |t|
    t.boolean  "favourite",  default: false
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks", ["listing_id"], name: "index_bookmarks_on_listing_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "listings", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.integer  "city"
    t.string   "postalCode"
    t.integer  "neighbourhood"
    t.integer  "price",                    default: 0
    t.integer  "numOfBed",                 default: 0
    t.integer  "numOfBath",                default: 0
    t.integer  "sqft",                     default: 0
    t.date     "yearBuilt"
    t.integer  "homeType"
    t.integer  "typeOwnership"
    t.integer  "daysListed",               default: 0
    t.integer  "lastUpdated",              default: 0
    t.integer  "levels",                   default: 0
    t.integer  "fullBathrooms",            default: 0
    t.integer  "halfBathrooms",            default: 0
    t.integer  "fireplaces",               default: 0
    t.date     "taxYear"
    t.integer  "taxes",                    default: 0
    t.integer  "strataFees",               default: 0
    t.integer  "lotSize"
    t.integer  "walkscore",                default: 0
    t.text     "propertySummary"
    t.text     "extraFeaturesDescription"
    t.integer  "parking",                  default: 0
    t.integer  "storage",                  default: 0
    t.integer  "basementArea",             default: 0
    t.boolean  "basement",                 default: false
    t.boolean  "bikeRoom",                 default: false
    t.boolean  "elevator",                 default: false
    t.boolean  "garden",                   default: false
    t.boolean  "inSuiteLaundry",           default: false
    t.boolean  "garage",                   default: false
    t.boolean  "doorman",                  default: false
    t.boolean  "gym",                      default: false
    t.boolean  "amenitiesRoom",            default: false
    t.boolean  "airconditioning",          default: false
    t.boolean  "washer",                   default: false
    t.boolean  "dishwasher",               default: false
    t.boolean  "stove",                    default: false
    t.boolean  "fridge",                   default: false
    t.boolean  "hotTub",                   default: false
    t.boolean  "pool",                     default: false
    t.boolean  "petFriendly",              default: false
    t.boolean  "wheelchairAccessible",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
