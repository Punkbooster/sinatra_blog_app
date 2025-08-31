class ApplicationController < Sinatra::Base
  # Define APP_ROOT here for use in the controller
  APP_ROOT = File.expand_path("../..", __dir__)

  # Enable the reloader in development
  configure :development do
    register Sinatra::Reloader
    # Enable automatic reloading of controllers and models
    also_reload File.join(APP_ROOT, "app", "controllers", "*.rb")
    also_reload File.join(APP_ROOT, "app", "models", "*.rb")
  end

  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")

  get "/" do
    @blogs = Blog.all

    erb :"application/index"
  end
end
