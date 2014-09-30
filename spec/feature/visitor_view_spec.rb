require 'feature_helper'

describe 'visitor goes to the home page' do
  
  context 'the home page' do
    before(:each) do
      vist home_path
    end

    it 'sees a navigation bar' do
      expect(page).to have_link('SeshOn')
      expect(page).to have_link('Sign In')
    end

    it 'sees sign in and registration buttons' do
      expect(page).to have_button('Sign In using Foursquare')
      expect(page).to have_button('Register Now with Foursquare')
      expect(page).to have_link("Don't Have a Foursquare Account?")
    end

    it 'sees a button to find skate spots' do
      expect(page).to have_button('Find Skate Spots!')
    end
  end

  context 'navigation from the home page' do
    before(:each) do
      visit home_path
    end

    how to test with Foursquare
      registration
      sign in
      
  end
end