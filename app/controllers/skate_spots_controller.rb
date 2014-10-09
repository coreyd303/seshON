class SkateSpotsController < ApplicationController
  respond_to :html, :json

  def index
    @spots = SkateSpot.all
  end

  def show
    @spot = SkateSpot.find(params[:id])

    @hash  = Gmaps4rails.build_markers(@spot) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def new
    @spot = SkateSpot.new
  end

  def create
    @spot = SkateSpot.new(spot_params)
    @spot.save 
    redirect_to skate_spots_path
  end

  def destroy
    @spot = SkateSpot.find(params[:id])
    @spot.destroy 
    redirect_to skate_spots_path
  end

  private

  def spot_params
    params.require(:skate_spot).permit(:name,
                                       :address,
                                       :city,
                                       :state,
                                       :zipcode,
                                       :latitude,
                                       :longitude,
                                       :image,
                                       :remote_image_url)
  end
end
