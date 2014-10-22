require 'rails_helper'
require 'feature_helper'

RSpec.describe Administrator::SkateSpotsController do
include Builders
include OmniHelper

  before(:each) do
    @park = skate_park
    mock_auth_hash
    @user = User.first
    request.session[:user_id] = @user.id
  end

  describe 'PUT update' do
    # :update response.should redirect_to :back
  end

  describe 'GET destroy' do
    it "deletes the user spot" do
      expect{ 
        delete :destroy, id: @park
      }.to change(SkateSpot, :count).by(-1)
    end
  end
end

