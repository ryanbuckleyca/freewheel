class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @bikes = Bike.all
  end
end
