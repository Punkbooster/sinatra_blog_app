class ApplicationController < Sinatra::Base
  APP_ROOT = File.expand_path("../..", __dir__)

  require "dotenv/load"

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
