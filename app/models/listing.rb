class Listing < ActiveRecord::Base
  belongs_to :user

  def self.allHomeType
    [["House", 0], ["Condo", 1], ["Townhouse", 2]]
  end

end
