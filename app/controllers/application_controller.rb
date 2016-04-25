class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :arranging_bookmarks, if: :current_user

  # def arranging_bookmarks
  #   @current_user_bookmarked_listings = current_user.bookmarked_listings.order("created_at ASC")
  # end


end
