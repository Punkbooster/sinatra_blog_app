#!/bin/bash
cd /home/arsen/projects/sinatra_blog_app
export $(cat .env | xargs)
exec /usr/share/rvm/wrappers/ruby-3.3.0/bundle exec puma -C config/puma.rb
