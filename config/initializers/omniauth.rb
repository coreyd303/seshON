Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, "ZPIPTWQFHU0QSL1E5JD5IO5APOHUTZI3YKKISR0ANBGPQYGO", "HSH2BCXQRMJSR3KF12O4QLS12M5TSUD5E3NQCGFSZN45HVGX", {provider_ignores_state: true}
end