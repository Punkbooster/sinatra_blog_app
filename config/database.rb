if ENV.fetch("RACK_ENV", "development") == "production"
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  database_name = "sinatra-blog-#{ApplicationController.environment}"
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: database_name,
    encoding: "utf8"
  )
end
