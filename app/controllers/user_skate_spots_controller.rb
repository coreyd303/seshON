class UserSkateSpotsController < ApplicationController

  def index
    @spots = UserSkateSpot.all

    @hash  = Gmaps4rails.build_markers(@spots) do |spot, marker|
      @spot = spot
      marker.infowindow render_to_string(:partial => "info")

      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def new
    @spot = UserSkateSpot.new
  end

  def create
    @spot = UserSkateSpot.new(spot_params)

    @spot.save
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
                                            :image)
  end
end
