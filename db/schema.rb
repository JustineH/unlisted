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

ActiveRecord::Schema.define(version: 20160425234250) do

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

  create_table "images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.integer  "user_id"
    t.integer  "neighbourhood_id"
    t.string   "address"
    t.string   "unit_number"
    t.string   "city",                  default: "Vancouver"
    t.string   "postal_code"
    t.integer  "price",                 default: 0
    t.integer  "bedrooms",              default: 0
    t.integer  "bathrooms",             default: 0
    t.integer  "size",                  default: 0
    t.integer  "year_built"
    t.string   "home_type"
    t.string   "type_ownership"
    t.integer  "levels",                default: 0
    t.integer  "full_bathrooms",        default: 0
    t.integer  "half_bathrooms",        default: 0
    t.integer  "fireplaces",            default: 0
    t.integer  "taxes",                 default: 0
    t.integer  "strata_fees",           default: 0
    t.integer  "lot_size",              default: 0
    t.integer  "walkscore",             default: 0
    t.text     "property_summary"
    t.text     "features_description"
    t.integer  "parking",               default: 0
    t.boolean  "storage",               default: false
    t.boolean  "basement",              default: false
    t.boolean  "bike_room",             default: false
    t.boolean  "elevator",              default: false
    t.boolean  "garden",                default: false
    t.boolean  "insuite_laundry",       default: false
    t.boolean  "garage",                default: false
    t.boolean  "doorman",               default: false
    t.boolean  "gym",                   default: false
    t.boolean  "amenities_room",        default: false
    t.boolean  "air_conditioning",      default: false
    t.boolean  "washer",                default: false
    t.boolean  "dishwasher",            default: false
    t.boolean  "stove",                 default: false
    t.boolean  "fridge",                default: false
    t.boolean  "hot_tub",               default: false
    t.boolean  "pool",                  default: false
    t.boolean  "pet_friendly",          default: false
    t.boolean  "wheelchair_accessible", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "dryer",                 default: false
  end

  add_index "listings", ["neighbourhood_id"], name: "index_listings_on_neighbourhood_id", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "neighbourhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "guest",                  default: false
    t.boolean  "seller",                 default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
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
