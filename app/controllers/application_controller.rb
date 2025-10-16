class ApplicationController < Sinatra::Base
  APP_ROOT = File.expand_path("../..", __dir__)
  require_relative "../helpers/markdown_helper"
  require "dotenv/load"

  helpers MarkdownHelper

  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")

  register do
    def auth
      condition do
        @auth ||= Rack::Auth::Basic::Request.new(request.env)

        is_authorized = @auth.provided? && @auth.basic? && @auth.credentials &&
                        Rack::Utils.secure_compare(@auth.credentials[0], ENV["ADMIN_LOGIN"]) &&
                        Rack::Utils.secure_compare(@auth.credentials[1], ENV["ADMIN_PASSWORD"])

        unless is_authorized
          response['WWW-Authenticate'] = %(Basic realm="Admin Area")
          throw(:halt, [401, "Not authorized\n"])
        end
      end
    end
  end

  get "/" do
    @blogs = Blog.all

    erb :"application/index"
  end
end
