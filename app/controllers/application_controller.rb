class ApplicationController < Sinatra::Base
  configure :development do
    set :show_exceptions, true
  end

  configure :production do
    set :show_exceptions, false
  end

  helpers do
    def development?
      settings.environment == :development
    end

    def production?
      settings.environment == :production
    end
  end

  APP_ROOT = File.expand_path("../..", __dir__)

  Dir[File.join(APP_ROOT, "app", "helpers", "*.rb")].each { |file| require file }
  Dir[File.join(APP_ROOT, "app", "utils", "*.rb")].each { |file| require file }

  Dir[File.join(APP_ROOT, "app", "helpers", "*.rb")].each do |file|
    module_name = File.basename(file, ".rb").split("_").map(&:capitalize).join
    helpers Object.const_get(module_name)
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
