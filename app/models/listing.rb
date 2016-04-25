class Listing < ActiveRecord::Base
  searchkick autocomplete: ['neighbourhood_id'], 
             synonyms: [["Kitsilano", "Kits"], ["Avenue", "Ave", "Av", "Ave.", "Av."], ["Street", "St", "St."]]

  belongs_to :user
  belongs_to :neighbourhood


  Listing.search("Killarn", autocomplete: true, limit: 10)

end

