class Listing < ActiveRecord::Base
  searchkick synonyms: [["Kitsilano", "Kits"], ["Avenue", "Ave", "Av", "Ave.", "Av."], ["Street", "St", "St."]]
  searchkick autocomplete: ['neighbourhood_id']

  belongs_to :user
  belongs_to :neighbourhood

end

