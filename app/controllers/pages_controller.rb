class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @my_bikes = Bike.where(user: current_user)
    @bikes_i_rent = Bike.joins(:rentals).where(rentals: { user_id: current_user.id })
    #@m = Rental.where(user: current_user)
    #raise
    # @my_bikes_rented =
    # @renting_history =
    # link to pages: message, usy_rentalser profile, pages link
  end

end
