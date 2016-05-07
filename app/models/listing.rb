require 'elasticsearch/model'


class Listing < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick synonyms: [["kitsilano", "kits"], ["avenue", "ave", "av", "ave.", "av."],\
   ["street", "str", "st", "st."], ["drive", "dr", "dr."], ["road", "rd", "rd."], ["boulevard", "blvd", "boul"],\
    ["court", "crt"], ["square", "sqr"], ["crescent", "cres", "crsent"], ["crossing", "xing"], ["alley", "ally"], \
    ["annex", "anex"], ["lane", "ln"], ["parkway", "pkwy", "pky"], ["place", "pl"], ["terrace", "terr"], \
    ["valley", "vally", "vlly"], ["way", "wy"], ["east", "e"], ["west", "w"]]

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


Listing.import
