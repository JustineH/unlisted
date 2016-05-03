class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :password, :presence => true,
                     :on => :create,
                     :format => {:with => /\A.*(?=.{8,})(?=.*\d)(?=.*[a-z]).*\Z/ }

  validates :email, :presence => true,
            :uniqueness =>true,
            :format => {:with => /.+@.+\..+/i}
            
  has_many :listings
  has_many :bookmarks

  has_many :bookmarked_listings, through: :bookmarks, source: :listing

  def self.new_guest
    new { |u| u.guest = true }
  end
  
  def name
    guest ? "Guest" : firstname
  end
  
  def move_to(user)
    tasks.update_all(user_id: user.id)
  end


end
