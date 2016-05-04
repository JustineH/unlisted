class Listing < ActiveRecord::Base

  searchkick synonyms: [["kitsilano", "kits"], ["avenue", "ave", "av", "ave.", "av."],\
   ["street", "str", "st", "st."], ["drive", "dr", "dr."], ["road", "rd", "rd."], ["boulevard", "blvd", "boul"],\
    ["court", "crt"], ["square", "sqr"], ["crescent", "cres", "crsent"], ["crossing", "xing"], ["alley", "ally"], \
    ["annex", "anex"], ["lane", "ln"], ["parkway", "pkwy", "pky"], ["place", "pl"], ["terrace", "terr"], \
    ["valley", "vally", "vlly"], ["way", "wy"], ["east", "e"], ["west", "w"]]

  belongs_to :user
  belongs_to :neighbourhood
  has_many :images

  validates :address, presence: true
  validates_uniqueness_of :address
  validates :price, presence: true, numericality: true
  validates :year_built, numericality: true
  validates :postal_code, presence: true, :postcode_format => {:country_code => :ca, :message => "is invalid."}
  validates :size, presence: true, numericality: true
  validates :lot_size, numericality: true
  validates :levels, numericality: true
  validates :taxes, numericality: true
  validates :strata_fees, numericality: true
  validates :property_summary, presence: true
  validates :features_description, presence: true
  
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

