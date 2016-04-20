class User < ActiveRecord::Base

  has_many :listings
  has_many :bookmarks

  def self.new_guest
    new { |u| u.guest = true }
  end
  
  def name
    guest ? "Guest" : username
  end
  
  def move_to(user)
    tasks.update_all(user_id: user.id)
  end

end
