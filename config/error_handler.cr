Lucky::ErrorHandler.configure do |settings|
  settings.show_debug_output = !LuckyEnv.production?
  #settings.show_debug_output = false # Useful to see what a user would see
end
