class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to bikes_path
  end

end


