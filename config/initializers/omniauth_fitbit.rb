require_relative '../../app/models/settings'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, Settings.fitbit.consumer_key, Settings.fitbit.consumer_secret
end
