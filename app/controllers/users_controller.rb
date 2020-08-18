class UsersController < ApplicationController
  def destroy 
    @user = User.find(params[:id])
    @user.destroy

end
