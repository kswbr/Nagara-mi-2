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
        feed_data = Feed.saveFeed(site.id,feed)
        Youtube.getMoviesByHtml(html).each do |movie|
          begin

            p "     Moive:" + movie

            data = Movie.new
            data.feed_id = feed_data.id
            data.title = feed.title
            data.url = movie
            data.publish = true
            youtube = Youtube.new(movie)
            thumbnail = youtube.getThumbnail(:high)
            data.image = thumbnail[:url] if (thumbnail != nil)
            data.play_time = youtube.getPlayTime

            p "     Thumb:" + data.image
            p "     PlayTime:" + data.play_time.to_s

            data.save
            p data.errors.messages
          rescue => e
            p "    =======GetMovieError!!======="
            p e
            next
          end
        end
      end
    end
  end
end
