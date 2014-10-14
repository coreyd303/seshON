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
      # 1. Setup the User Mailer
      # 2. Setup Resque or Sidekiq 
        # Resque.enqueue(UserMailer.send_sign_up_notification(user).deliver)
        # -> loads into Redis
        # some_method.enqueue
      # --> UserMailer.send_sign_up_notification(user).deliver
    end
  end
end