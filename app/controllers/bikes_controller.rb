class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :bikes ]

  def index
    if params[:query].present?
      @bikes = Bike.where(bike_type: params[:query])
      @query = params[:query]
    else
      @bikes = Bike.all
    end
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
