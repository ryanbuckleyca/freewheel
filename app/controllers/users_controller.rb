class UsersController < ApplicationController
<<<<<<< HEAD
  def destroy 
    @user = User.find(params[:id])
    @user.destroy

    redirect_to bikes_path
=======
  skip_before_action :authenticate_user!, only: :home
  def home
  end
>>>>>>> c199b317a1cee1a92291977c915fca16ae01442c
end
