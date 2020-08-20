class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :bikes ]
  before_action :user_location

  def index
    if params[:query].present?
      @bikes = Bike.where("(lower(bike_type) LIKE '%#{params[:query].downcase}%')
                        OR (lower(brand) LIKE '%#{params[:query].downcase}%')
                        OR (year = #{params[:query].to_i})")
      @query = params[:query]
    else
      @bikes = Bike.all
    end

    @bikes_location = Bike.geocoded
  end

  def show
    @bike = Bike.find(params[:id])
    @bikes = Bike.all
    @rental = Rental.new

    @bikes_location = Bike.geocoded
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def user_location
    @user_location = [ request.location.latitude, request.location.longitude ]
  end

  def bike_params
    params.require(:bike).permit(:frame_size, :seat_count, :bike_type, :year, :brand, :price, :location, :available_for_rent, :photo)
  end
end
