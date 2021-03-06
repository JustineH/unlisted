class UsersController < ApplicationController
  def index
  end
 
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
  end

  # Allows user to make a guest account
  # Move Guest data into actual user once signed up
  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest
    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render "new"
    end
  end

end
