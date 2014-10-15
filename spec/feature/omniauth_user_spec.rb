require 'feature_helper'

RSpec.describe 'Facebook log in', type: :feature do
  include OmniHelper
  it 'signs in successfully' do
    visit root_path
    mock_auth_hash
    first(:link, 'Sign In with Facebook').click

    expect(page).to have_link("Submit SeshON Spot")
    expect(page).to have_link("User SeshON Spots")
    expect(page).to have_link("Sign Out")
  end

  it 'cannot log in with invalid credentials' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    expect(current_path).to eq(nil)
  end
end