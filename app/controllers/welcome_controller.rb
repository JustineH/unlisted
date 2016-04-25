class WelcomeController < ApplicationController

  def index
    @listings = Listing.all
    # @user = current_user.id

    # @bookmarked_listings = current_user.bookmarked_listings
  end
end
