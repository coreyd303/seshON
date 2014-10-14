require 'feature_helper'

describe 'the visitor view', type: :feature do
  
  context 'the home page' do
    before(:each) do
      visit ('/home')
    end

    it 'sees the home page' do
      expect(page).to have_link('Seshon')
      expect(page).to have_link('Sign In with Facebook')
      expect(page).to have_link('Find Skate Parks')
    end
  end

  context 'skate parks index' do
    before(:each) do
      visit ('/home')
    
      3.times do 
        SkateSpot.create
      end

      @spots = SkateSpot.all
    end

    it 'goes to the find skate parks page' do
      first(:link, 'Find Skate Parks').click
      # click_link('Find Skate Parks')
      expect(current_path).to eq(skate_maps_path)
    end

    it 'sees information about skate parks' do
      visit skate_maps_path

      @spots.each do |spot|
        expect(page).to have_content(spot.id)
      end
    end

    it 'can see details on a skate parks' do
      spot = SkateSpot.create(name: "Denver")
      visit skate_maps_path

      click_link("Denver")
      expect(current_path).to eq(skate_spot_path(spot))
      expect(page).to have_content(spot.name)
    end
  end
end