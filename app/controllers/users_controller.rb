class UsersController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: :home

  def destroy
=======
  # skip_before_action :authenticate_user!, only: :home
  def destroy 
>>>>>>> master
    @user = User.find(params[:id])
    @user.destroy

    redirect_to bikes_path
  end

end


