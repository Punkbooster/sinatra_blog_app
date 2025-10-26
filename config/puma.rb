require 'dotenv'
Dotenv.load

require "fileutils"

threads ENV.fetch("PUMA_MIN_THREADS", 2), ENV.fetch("PUMA_MAX_THREADS", 10)

app_dir = File.expand_path("../..", __FILE__)
env = ENV.fetch("RACK_ENV", "development")

FileUtils.mkdir_p [
	File.join(app_dir, "run", "sockets"),
	File.join(app_dir, "run", "pids"),
	File.join(app_dir, "logs")
]

if env == "production"
	workers ENV.fetch("PUMA_WORKERS", 2)
	bind "unix://#{app_dir}/run/sockets/puma.sock"
else
	port ENV.fetch("PORT", 9292)
end

stdout_redirect "#{app_dir}/logs/puma.stdout.log", "#{app_dir}/logs/puma.stderr.log", true

pidfile "#{app_dir}/run/pids/puma.pid"
rackup "#{app_dir}/config.ru"
state_path "#{app_dir}/run/pids/puma.state"

activate_control_app

# Allow `bundle exec puma -C config/puma.rb` to be restarted with `touch tmp/restart.txt`
plugin :tmp_restart
