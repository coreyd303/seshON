class SkateSpotsController < ApplicationController
  respond_to :html, :json

  def index
    @skate_spots = SkateSpot.all
  end

  def show
    @spot = SkateSpot.find(params[:id])

    @hash  = Gmaps4rails.build_markers(@spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def new
    @skate_spot = SkateSpot.new
  end

  def create
    @skate_spot = SkateSpot.new(spot_params)
    @skate_spot.save 
    redirect_to skate_spots_path
  end

  def destroy
    @skate_spot = SkateSpot.find(params[:id])
    @skate_spot.destroy 
    redirect_to skate_spots_path
  end

  private

  def spot_params
    params.require(:skate_spot).permit(:name,
                                       :address,
                                       :city,
                                       :zipcode)
  end
end
