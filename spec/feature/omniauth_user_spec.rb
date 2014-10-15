require 'rails_helper'

RSpec.describe 'Facebook log in', type: :feature do
  it 'signs in successfully' do
    visit root_path
    mock_auth_hash
    first(:link, 'Sign In with Facebook').click
    save_and_open_page
    expect(page).to have_link("Submit SeshON Spot")
    expect(page).to have_link("User SeshON Spots")
    expect(page).to have_link("Sign Out")
  end

  it 'cannot log in with invalid credentials' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    expect(current_path).to eq(nil)
  end

  def mock_auth_hash
    mock = OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      "provider"    => "facebook",
      "uid"         => "12345",
      "credentials" => {
         "oauth_token" => nil
      },
      "info"        => {
                "name"  => "Person",
                "email" => "me@example.com"
        }
      })

      create_mock_user(mock)
  end

  def create_mock_user(mock)
    User.new do |user|
      user.name        = mock.info.name
      user.email       = mock.info.email
      user.oauth_token = mock.credentials.oauth_token
      user.provider    = mock.provider
      user.uid         = mock.uid
      user.save!
    end
  end
end