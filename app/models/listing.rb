class Listing < ActiveRecord::Base
  belongs_to :user

  # def self.allHomeType
  #   [["House", 0], ["Condo", 1], ["Townhouse", 2]]
  # end

  def self.allNeighbourhoods
    [["Gastown", 0], ["Yaletown", 1], ["Chinatown", 2], ["Kitsilano", 3], ["Main Street", 4]]
  end

  def random_type(words)
    words[rand(words.length)]
  end

  random_type(["Condo", "House", "Townhouse"])

  def random_ownership(words)
    words[rand(words.length)]
  end

  random_ownership(["Freehold Strata", "Freehold Nonstrata", "Leasehold prepaid-Strata"])


end
