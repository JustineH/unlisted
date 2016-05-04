class Listing < ActiveRecord::Base

  searchkick synonyms: [["kitsilano", "kits"], ["avenue", "ave", "av", "ave.", "av."], ["street", "st", "st."], ["east", "e"], ["west", "w"]]

  belongs_to :user
  belongs_to :neighbourhood
  has_many :images


  
  def search_data
    {
      address: address,
      neighbourhood: neighbourhood.name,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      price: price,
      home_type: home_type
    }
  end

end

