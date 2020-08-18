class UsersController < ApplicationController
  def destroy 
    @user = User.find(params[:id])
    @user.destroy

    redirect_to bikes_path
end
