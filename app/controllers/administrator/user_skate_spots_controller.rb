class Administrator::UserSkateSpotsController < AdminsController

  def index
    @approved_spots = UserSkateSpot.approved
    @pending_spots  = UserSkateSpot.pending
  end

  def show
    @user_spot = UserSkateSpot.find(params[:id])
  end

  def edit
    @spot = UserSkateSpot.find(params[:id])
  end

  def destroy
    @spot = UserSkateSpot.find(params[:id])
    @spot.destroy
    redirect_to administrator_user_skate_spots_path
  end

  def approval
    UserSkateSpot.find(params[:id]).update_attribute(:approval, true)
    redirect_to :back
  end

  def denial
    UserSkateSpot.find(params[:id]).update_attribute(:approval, false)
    redirect_to :back
  end

  private

  def user_spot_params
    params.require(:user_skate_spot).permit(:approval)
  end
end