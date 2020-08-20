class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(@rental)
  end

  # need to add a method update
  # and then confirmed

  private

  def rental_params
    params.require(:rental).permit(:rental_start, :rental_end, :message, :booking_confirmed)
  end

end
