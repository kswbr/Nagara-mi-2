class CollectFeedsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def self.parseYoutubeId(url)
     str = url.match(%r{.*embed/([\w\-]+).*})
     return str[1] if (str.present? && str[1])
  end

  def self.execYoutubeDataApi
    id = parseYoutubeId(id) if (id.include?("embed/"))
    api_url = "https://www.googleapis.com/youtube/v3/videos"
    api_key = "AIzaSyDJaLQ75TEWLKzFYBvmspKMp51skNRjJTE"
    part = "snippet,contentDetails,statistics,status"

    uri = URI.parse("#{api_url}?id=#{id}&key=#{api_key}&part=#{part}")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json, {:symbolize_names => true})
    result
  end
end
