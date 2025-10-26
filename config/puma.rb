environment ENV["RACK_ENV"] || "development"

workers ENV.fetch("WEB_CONCURRENCY", 2)

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count

base_dir = "/home/arsen/projects/sinatra_blog_app"

bind "unix://#{base_dir}/run/sockets/puma.sock"

pidfile "#{base_dir}/run/pids/puma.pid"
state_path "#{base_dir}/run/pids/puma.state"

plugin :tmp_restart
