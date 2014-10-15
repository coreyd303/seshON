class UserSkateSpotsController < ApplicationController
  include UserSkateSpotsHelper

  def index
    @user_spots = UserSkateSpot.approved
    user_spots_to_hash(@user_spots)
  end

  def show
    @user_spot = UserSkateSpot.find(params[:id])
    user_spot_to_hash(@user_spot)
  end

  def new
    @spot = UserSkateSpot.new
  end

  def create
    @spot = UserSkateSpot.create(spot_params)
    flash[:notice] = "Your spot has been submitted, check your email for details on approval"
    redirect_to user_skate_spots_path
  end

  private

  def spot_params
    params.require(:user_skate_spot).permit(:name,
                                            :address,
                                            :city,
                                            :state,
                                            :zipcode,
                                            :latitude,
                                            :longitude,
                                            :image,
                                            :approval)
  end
end
