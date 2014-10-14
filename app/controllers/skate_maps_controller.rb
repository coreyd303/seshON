class SkateMapsController < ApplicationController
  include SkateSpotsHelper

  def index
    @spots = SkateSpot.all
    spots_to_hash(@spots)
  end

  def show
    @spot = Skatespot.find(params[:id])
    spot_to_hash(@spot)
  end
end
