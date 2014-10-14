class UserSkateSpotsController < ApplicationController

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
    redirect_to user_skate_spots_path
  end

  def user_spots_to_hash(user_spots)
    @hash   = Gmaps4rails.build_markers(user_spots) do |spot, marker|
      @spot = spot
      marker.infowindow render_to_string(:partial => "info")

      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def user_spot_to_hash(user_spot)
    @hash  = Gmaps4rails.build_markers(user_spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
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
