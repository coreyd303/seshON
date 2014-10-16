require 'feature_helper'

RSpec.describe 'the admin view', type: :feature do
  include OmniHelper
  include Builders

  before(:each) do
    mock_auth_hash
    visit ('/home')
    first(:link, 'Sign In with Facebook').click
  end

  it 'can see the admin dashboard' do
    expect(page).to have_link('Person')
    
    click_link('Person')
    expect(current_path).to eq(administrator_admins_path)
    expect(page).to have_link('Manage Skate Parks')
    expect(page).to have_link('Manage User Skate Spots')
  end

  context 'admin actions' do
    before(:each) do
      click_link('Person')
      skate_parks

    end

    it 'can view current skate spots' do
      click_link('Manage Skate Parks')

      expect(current_path).to eq(administrator_skate_spots_path)

      @parks.each do |park|
        expect(page).to have_link(park.name)
        expect(page).to have_content(park.city)
        expect(page).to have_content(park.state)
      end

      first(:link, @park.name).click
      expect(current_path).to eq(administrator_skate_spot_path(@park))

      expect(page).to have_content(@park.name)
      expect(page).to have_content(@park.address)
    end

    it 'can edit and delete current skate spots' do
      click_link('Manage Skate Parks')
      first(:link, 'Edit').click

      expect(current_path).to eq(edit_administrator_skate_spot_path(@park))

      fill_in "skate_spot[name]", with: 'New Name'
      click_button('Submit')

      expect(page).to_not have_content('New Name')
    end

    it 'can create new skate spots' do
      click_link('Manage Skate Parks')

      click_link('Add New Skate Park')
      
      fill_in "skate_spot[name]", with: 'Another Spot'
      click_button('Submit')

      expect(page).to have_content('Another Spot')
    end
    context 'admin user skate spot actions' do
      before(:each) do
        @aspot = approved_user_spot
        @dspot = denied_user_spot

        click_link('Manage User Skate Spots')
      end

      it 'can view current user skate spots' do
        expect(current_path).to eq(administrator_user_skate_spots_path)
        
        expect(page).to have_link(@aspot.name)
        expect(page).to have_link(@dspot.name)

        expect(page).to have_link('Approve')
        expect(page).to have_link('Deny')
        expect(page).to have_link('Delete')
      end

      it 'can approve user skate spots' do
        spot = UserSkateSpot.first

        click_link('Approve')
        expect(spot.approval).to eq(true)
      end

      it 'can deny user skate spots' do
        spot = UserSkateSpot.last

        click_link('Deny')
        expect(spot.approval).to eq(false)
      end

      it 'can delete user skate spots' do
        expect(page).to have_link(@aspot.name)
        first(:link, 'Delete').click
        expect(page).to_not have_link(@aspot.name)
      end
    end
  end
end