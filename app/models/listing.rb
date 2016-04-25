class Listing < ActiveRecord::Base
  searchkick synonyms: [["Kitsilano", "Kits"], ["Avenue", "Ave", "Av", "Ave.", "Av."], ["Street", "St", "St."], ["East", "E"], ["West", "W"]]
            # autocomplete: ['neighbourhood_id'] 

  belongs_to :user
  belongs_to :neighbourhood



end

