class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighbourhood

   # TYPE_OWNERSHIP = ["Freehold Strata", "Leasehold Prepaid-Strata", "Cooperative"]
   # TYPE_PROPERTY = ["Apartment/Condo","House/Single Family","Townhouse"]
 
end
