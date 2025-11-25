# Load .env file for rake tasks
require 'dotenv'

Dotenv.load
require "bundler"

Bundler.require # loops over each gem in your Gemfileand requires all gem entries for use in Rake tasks.

require "sinatra/activerecord/rake"
require "rack/auth/basic"
require "rack/utils"
