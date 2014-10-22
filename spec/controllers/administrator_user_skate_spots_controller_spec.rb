require 'rails_helper'
require 'feature_helper'

RSpec.describe Administrator::UserSkateSpotsController do
include Builders
include OmniHelper

  before(:each) do
    @approved_spot = approved_user_spot
    @denied_spot   = denied_user_spot
    mock_auth_hash
    @user = User.first
    request.session[:user_id] = @user.id
  end

  describe "GET index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    it 'assigns @user_spot' do
      get :show, id: @approved_spot.id
      expect(assigns(:user_spot)).to eq(@approved_spot)
    end
  end

  describe "GET destroy" do
    it "deletes the user spot" do
      expect{ 
        delete :destroy, id: @denied_spot
      }.to change(UserSkateSpot, :count).by(-1)
    end
  end
end