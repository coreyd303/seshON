module SkateSpotsHelper

  def spots_to_hash(spots)
    @hash   = Gmaps4rails.build_markers(spots) do |spot, marker|
      @spot = spot
      marker.infowindow render_to_string(:partial => "info")

      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def spot_to_hash(spot)
    @hash  = Gmaps4rails.build_markers(spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end
end
