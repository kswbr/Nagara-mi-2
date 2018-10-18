namespace :truncate do
  desc "search and save movie by feed_id"
  task :run => :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE site_types;")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE sites;")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE feeds;")
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE movies;")
  end
end
