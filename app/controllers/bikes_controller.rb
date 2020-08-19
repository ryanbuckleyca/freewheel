class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :bikes ]

  def index
    @bikes = Bike.all
  end

  def show
   @bike = Bike.find(params[:id])
   @bikes = Bike.all
  end

  private

  def bike_params
    params.require(:bike).permit(:photo)
  end
end
