require "bundler"
Bundler.require

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

# First require application controller as other controllers inherit from it
require File.join(APP_ROOT, "app", "controllers", "application_controller.rb")

# Then require all other controllers
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each do |file|
  next if file.include?('application_controller.rb') # Skip application_controller as we already required it
  require file
end

# require the model(s)
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file }

# require database configurations
require File.join(APP_ROOT, "config", "database")
