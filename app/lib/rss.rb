class RSS
  def self.readEntries(url, prev_latest_published = 0)
    begin
      Feedjira.logger.level = Logger::FATAL
      feed = Feedjira::Feed.fetch_and_parse(url)
      feed.entries.select {|entry| entry.published > prev_latest_published}
    rescue
      nil
    end
  end
end
