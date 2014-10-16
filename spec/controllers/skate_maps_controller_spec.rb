require 'rails_helper'

RSpec.describe SkateSpotsController do
include Builders

  before(:each) do
    @park = skate_park
  end

  describe "GET index" do
    it 'assigns @spots' do
      get :index
      expect(assigns(:spots)).to eq([@park])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @user_spot' do
      get :show, id: @park.id
      expect(assigns(:spot)).to eq(@park)
    end
    
    it 'renders the show template' do
      get :show, id: @park.id
      expect(response).to render_template('show')
    end
  end
end