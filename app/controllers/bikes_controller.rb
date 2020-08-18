class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def index
    @bikes = Bike.all
  end
end
