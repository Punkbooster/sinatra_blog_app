if ENV.fetch("RACK_ENV", "development") == "production"
  database_url = ENV["DATABASE_URL"]

  raise "DATABASE_URL environment variable is required in production." if database_url.blank?

  ActiveRecord::Base.establish_connection(database_url)
else
  database_name = "sinatra-blog-#{ApplicationController.environment}"

  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: database_name,
    encoding: "utf8"
  )
end
