class ApplicationController < Sinatra::Base
  APP_ROOT = File.expand_path("../..", __dir__)
  require_relative "../helpers/markdown_helper"
  require_relative "../helpers/authorization_helper"
  require_relative '../utils/protected_action'
  require "dotenv/load"

  helpers MarkdownHelper
  helpers AuthorizationHelper

  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")

  get "/" do
    @blogs = Blog.all

    erb :"application/index"
  end
end
