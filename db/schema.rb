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

ActiveRecord::Schema.define(version: 20160421012011) do

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
    t.string   "postal_code"
    t.integer  "neighbourhood"
    t.integer  "price",                    default: 0
    t.integer  "bedrooms",                 default: 0
    t.integer  "bathrooms",                default: 0
    t.integer  "size",                     default: 0
    t.date     "year_built"
    t.integer  "home_type"
    t.integer  "type_ownership"
    t.integer  "days_listed",              default: 0
    t.integer  "last_updated",             default: 0
    t.integer  "levels",                   default: 0
    t.integer  "full_bathrooms",           default: 0
    t.integer  "half_bathrooms",           default: 0
    t.integer  "fireplaces",               default: 0
    t.date     "taxYear"
    t.integer  "taxes",                    default: 0
    t.integer  "strata_fees",              default: 0
    t.integer  "lot_size"
    t.integer  "walkscore",                default: 0
    t.text     "property_summary"
    t.text     "extraFeaturesDescription"
    t.integer  "parking",                  default: 0
    t.integer  "storage",                  default: 0
    t.integer  "basement_area",            default: 0 # Text instead?
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
    t.integer  "area"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "seller",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
