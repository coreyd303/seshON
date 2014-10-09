class SkateMapsController < ApplicationController
  def index
    @spots = SkateSpot.all

    @hash  = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def show
    @spot = Skatespot.find(params[:id])

    @hash  = Gmaps4rails.build_markers(@spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end
end
