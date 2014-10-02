OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '762717537134813', '0acfaf90b9e1813df9d0d7b127cfc436'
end