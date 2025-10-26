environment ENV['RACK_ENV'] || 'development'
port        ENV['PORT']     || 3000

workers ENV.fetch('WEB_CONCURRENCY', 2)

threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
threads threads_count, threads_count

bind "unix:///var/www/sinatra_blog/shared/tmp/sockets/puma.sock"

pidfile "/var/www/sinatra_blog/shared/tmp/pids/puma.pid"
state_path "/var/www/sinatra_blog/shared/tmp/pids/puma.state"

plugin :tmp_restart
