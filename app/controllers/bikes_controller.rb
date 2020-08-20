class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :bikes ]

  def index
    if params[:query].present?
      @bikes = Bike.where("(lower(bike_type) LIKE '%#{params[:query].downcase}%')
                        OR (lower(brand) LIKE '%#{params[:query].downcase}%')
                        OR (year = #{params[:query].to_i})")
      @query = params[:query]
    else
      @bikes = Bike.all
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @bikes = Bike.all
    @rental = Rental.new
  end

  private

  def bike_params
    params.require(:bike).permit(:photo)
  end
end
