namespace :feed do
  desc "search and save movie by feed_id"
  task :save_movie => :environment do
    CollectFeedsJob.perform_now
  end
end
