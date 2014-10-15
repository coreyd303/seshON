require 'rails_helper'

RSpec.describe UserSkateSpotsController do
include Builders

  before(:each) do
    @spot = approved_user_spot
  end

  describe "GET index" do
    it 'assigns approved @user_spots' do
      get :index
      expect(assigns(:user_spots)).to eq([@spot])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @user_spot' do
      get :show, id: @spot.id
      expect(assigns(:user_spot)).to eq(@spot)
    end
    
    it 'renders the show template' do
      get :show, id: @spot.id
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    it 'assigns a new spot @spot' do
      get :new
      expect(assigns(:spot)).to be_a_new(UserSkateSpot)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new spot' do
        user_spot_attributes

        expect {
          post :create, :user_skate_spot => @attributes
            }.to change(UserSkateSpot, :count).by 1
      end
    end
  end
end