class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(@rental)
  end

  def create
    @bikes = Bike.all
    @bike = Bike.find(params[:bike_id])

    @rental = Rental.create(rental_params)
    @rental.bike = @bike
    @rental.user = current_user

    if @rental.save
      redirect_to dashboard_path
    else
      render "bikes/show"
    end
  end

  def mark_as_accepted
    @rental = Rental.find(params[:id])
    @rental.accept!
    @rental.save
    redirect_to dashboard_path
  end

  def mark_as_rejected
    @rental = Rental.find(params[:id])
    @rental.reject!
    @rental.save
    redirect_to dashboard_path
  end

private

  def rental_params
    params.require(:rental).permit(:rental_start, :rental_end, :message, :booking_confirmed)
  end

end
