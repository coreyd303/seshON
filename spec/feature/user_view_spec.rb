require 'feature_helper'

describe 'the visitor view', type: :feature do
  include OmniHelper

  context 'the home page' do
    before(:each) do
      visit ('/home')
    end

    it 'sees the home page' do
      expect(page).to have_link('SeshON ninja')
      expect(page).to have_link('Sign In with Facebook')
      expect(page).to have_link('Find Skate Parks')
    end
  end

  context 'skate parks index' do
    before(:each) do
      3.times do 
        SkateSpot.create
      end

      @spots = SkateSpot.all

      visit ('/home')
    end

    it 'goes to the find skate parks page' do
      first(:link, 'Find Skate Parks').click
      expect(current_path).to eq(skate_spots_path)
    end

    it 'sees information about skate parks' do
      visit skate_spots_path

      @spots.each do |spot|
        expect(page).to have_content(spot.id)
      end
    end

    it 'can see details on a skate parks' do
      spot = SkateSpot.create(name: "Denver")
      visit skate_spots_path

      click_link("Denver")
      expect(current_path).to eq(skate_spot_path(spot))
      expect(page).to have_content(spot.name)
    end
  end

  context 'it can use the user seshon' do
    before(:each) do
      mock_auth_hash
    end

    it 'logs in and can see the links for user sessions' do
      visit ('/home')

      first(:link, 'Sign In with Facebook').click
      expect(page).to have_link('User SeshON Spots')
      expect(page).to have_link('Submit SeshON Spot')
    end

    it 'can submit a new user session spot and see it' do
      visit ('home')
      first(:link, 'Sign In with Facebook').click
      first(:link, 'Submit SeshON Spot').click

      expect(current_path).to eq(new_user_skate_spot_path)
      
      page.fill_in "user_skate_spot[name]",    with: "Turing Shred"
      page.fill_in "user_skate_spot[address]", with: "123 here street"
      page.fill_in "user_skate_spot[city]",    with: "Denver"
      page.fill_in "user_skate_spot[zipcode]", with: "80333"

      page.click_button('Submit')
      
      expect(page).to have_content("Your spot has been submitted, check your email for details on approval")
    end

    it 'can see user skate spots' do
      user_spot = UserSkateSpot.create(name: "Turing Shred", approval: true)

      visit ('home')
      first(:link, 'Sign In with Facebook').click
      first(:link, 'User SeshON Spots').click

      page.click_link("Turing Shred")
      expect(current_path).to eq(user_skate_spot_path(user_spot))
    end

    it 'can logout' do
      visit ('home')
      first(:link, 'Sign In with Facebook').click

      expect(page).to have_link('Sign Out')

      click_link('Sign Out')

      expect(page).to have_content("You have been signed out")
    end
  end
end