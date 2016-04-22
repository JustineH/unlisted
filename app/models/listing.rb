class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighbourhood

  TYPE_OWNERSHIP = ["Freehold Strata", "Freehold NonStrata", "Leasehold Prepaid-Strata", "Cooperative Ownership"]

  TYPE_PROPERTY = ["Condo", "House", "Townhouse"]

end
