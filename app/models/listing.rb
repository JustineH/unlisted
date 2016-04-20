class Listing < ActiveRecord::Base
  belongs_to :user

  def self.allHomeType
    [["House", 0], ["Condo", 1], ["Townhouse", 2]]
  end

  def self.allNeighbourhoods
    [["Gastown", 0], ["Yaletown", 1], ["Chinatown", 2], ["Kitsilano", 3], ["Main Street", 4]]
  end

end
