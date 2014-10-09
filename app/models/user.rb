class User < ActiveRecord::Base

  has_many :skate_spots

  def self.from_omniauth(auth)
    user = find_with_auth(auth)
    create_with_auth(auth) unless user
    user
  end

  def self.find_with_auth(auth)
    User.find_by(
      provider: auth.provider,
      uid:      auth.uid
      )
  end

  def self.create_with_auth(auth)
    User.new do |user|
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.oauth_token = auth.credentials.oauth_token
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.save!
    end
  end
end