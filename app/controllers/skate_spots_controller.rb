class SkateSpotsController < ApplicationController
  respond_to :html, :json

  include SkateSpotsHelper

  def index
    @spots = SkateSpot.all
  end

  def show
    @spot = SkateSpot.find(params[:id])
    spot_to_hash(@spot)
  end
end
