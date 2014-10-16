class Administrator::SkateSpotsController < AdminsController
include SkateSpotsHelper
  
  def index
    @spots = SkateSpot.all
  end

  def show
    @spot = SkateSpot.find(params[:id])
    spot_to_hash(@spot)
  end

  def new
    @spot = SkateSpot.new
  end

  def create
    @spot = SkateSpot.create(spot_params)
    redirect_to administrator_skate_spots_path
  end

  def edit
    @spot = SkateSpot.find(params[:id])
  end

  def update
    @spot.update(spot_params)
    redirect_to administrator_skate_spot_path(@spot)
  end

  def destroy
    @spot = SkateSpot.find(params[:id])
    @spot.destroy
    redirect_to administrator_skate_spots_path
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
                                       :image)
  end
end