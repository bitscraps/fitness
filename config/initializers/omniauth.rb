Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone,
    ENV['JAWBONE_CLIENT_ID'],
    ENV['JAWBONE_CLIENT_SECRET'],
    :scope => "basic_read extended_read move_read sleep_read meal_read weight_read generic_event_read mood_read"
end
