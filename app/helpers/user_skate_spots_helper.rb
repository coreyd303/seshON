module UserSkateSpotsHelper

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
end
