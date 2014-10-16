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
  #   it 'assigns approved @user_spots' do
  #     get :index
  #     expect(assigns(:appoved_spots)).to eq([@approved_spot])
  #     expect(assigns(:pending_spots)).to eq([@denied_spot])
  #   end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET destroy' do
    it "deletes the user spot" do
      expect{ 
        delete :destroy, id: @denied_spot
      }.to change(UserSkateSpot, :count).by(-1)
    end
  end
end