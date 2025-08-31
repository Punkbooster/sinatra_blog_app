require "bundler"

Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require File.expand_path("../config/environment", __FILE__)

map('/blogs/') { run BlogsController }
map('/') { run ApplicationController }
