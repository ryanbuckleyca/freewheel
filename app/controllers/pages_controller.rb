class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @my_bikes = Bike.where(user: current_user)
    @bikes_i_rent = Bike.joins(:rentals).where(rental: { user: current_user })
    #@my_rentals = Rental.where(Bike.user == current_user)
    # @my_bikes_rented =
    # @renting_history =
    # link to pages: message, user profile, pages link
  end

end
