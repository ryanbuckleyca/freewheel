class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @user = current_user
    @my_bikes = Bike.where(user: current_user)
    @bikes_i_rent = Bike.joins(:rentals).where(rentals: { user_id: current_user.id })
    @my_rentals = Rental.where(user: current_user)
    @rental_request_received = Rental.joins(:bike).where(bikes: { user_id: current_user.id })
  end

end
