class ????? < ActiveRecord::Migration

  create_table "listings", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "unit_number"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "city",                     default: "Vancouver"
    t.string   "postal_code"              
    t.string   "neighbourhood"            
    t.integer  "price",                    default: 0
    t.integer  "bedrooms",                 default: 0
    t.integer  "bathrooms",                default: 0
    t.integer  "size",                     default: 0
    t.integer  "year_built",               default: 0
    t.string   "home_type"
    t.string   "type_ownership"
    t.integer  "levels",                   default: 0
    t.integer  "full_bathrooms",           default: 0
    t.integer  "half_bathrooms",           default: 0
    t.integer  "fireplaces",               default: 0
    t.integer  "taxes",                    default: 0
    t.integer  "strata_fees",              default: 0
    t.integer  "lot_size"                  default: 0
    t.integer  "walkscore",                default: 0
    t.text     "property_summary"        
    t.integer  "parking",                  default: 0
    t.boolean  "storage",                  default: false                  
    t.boolean  "basement",                 default: false
    t.boolean  "bike_room",                default: false
    t.boolean  "elevator",                 default: false
    t.boolean  "garden",                   default: false
    t.boolean  "in_suite_laundry",         default: false
    t.boolean  "garage",                   default: false
    t.boolean  "doorman",                  default: false
    t.boolean  "gym",                      default: false
    t.boolean  "amenities_room",           default: false
    t.boolean  "air_conditioning",         default: false
    t.boolean  "washer",                   default: false
    t.boolean  "dishwasher",               default: false
    t.boolean  "stove",                    default: false
    t.boolean  "fridge",                   default: false
    t.boolean  "hot_tub",                  default: false
    t.boolean  "pool",                     default: false
    t.boolean  "pet_friendly",             default: false
    t.boolean  "wheelchair_accessible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    end
end
