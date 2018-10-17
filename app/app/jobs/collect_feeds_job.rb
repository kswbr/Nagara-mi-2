class CollectFeedsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sites = Site.all
    sites.each do |site|
      latest_feed = site.feeds.latest[0]
      if latest_feed and latest_feed.published then
        feeds = RSS.readEntries(site.url,latest_feed.published)
      else
        feeds = RSS.readEntries(site.url)
      end

      next unless feeds
      feeds.each do |feed|
        p "   Feed:" +  feed.title
        begin
          html = Nokogiri.HTML(open(feed.url))
        rescue
          next
        end
        Feed.saveFeed(site.id,feed)
        Youtube.getMoviesByHtml(html).each do |movie|
          begin

            p "     Moive:" + movie

            movie_data = Movie.new
            movie_data.feed_id = feed.id
            movie_data.title = feed.title
            movie_data.url = movie

            youtube = Youtube.new(movie)
            thumbnail = youtube.getThumbnail(:high)
            movie_data.image = thumbnail[:url] if (thumbnail != nil)
            movie_data.play_time = youtube.getPlayTime

            p "     Thumb:" + movie_data.image
            p "     PlayTime:" + movie_data.play_time.to_s

            movie_data.save
          rescue => e
            p "    =======GetMovieError!!======="
            p e
          end
        end
      end
    end
  end
end
