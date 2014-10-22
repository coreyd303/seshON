require 'rails_helper'

module OmniHelper
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
      user.role        = "admin"
      user.save!
    end
  end
end