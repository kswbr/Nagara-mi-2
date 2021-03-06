class Youtube
  attr_accessor :id, :data

  def initialize(url)
    @id = Youtube.parseId(url)
    @data = Youtube.execDataApi(@id)
  end

  def self.parseId(url)
     str = url.match(%r{.*embed/([\w\-]+).*})
     return str[1] if (str.present? && str[1])
  end

  def self.execDataApi(id)
    id = parseId(id) if (id.include?("embed/"))
    api_url = "https://www.googleapis.com/youtube/v3/videos"
    api_key = ENV["YOUTUBE_ID"]
    part = "snippet,contentDetails,statistics,status"

    uri = URI.parse("#{api_url}?id=#{id}&key=#{api_key}&part=#{part}")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json, {:symbolize_names => true})
    result
  end

  def self.getMoviesByHtml(html)
    movies = []
    begin
      html.css("iframe").each do |movie|
        url = movie.attribute("src").value

        if (url.include?("youtube.com/embed/"))
          id = parseId(url)
          movies << "//www.youtube.com/embed/#{id}"
        end
      end
    rescue
    end
    movies
  end

  def getThumbnail(key = :default)
    begin
      @data[:items][0][:snippet][:thumbnails][key]
    rescue
      nil
    end
  end
  def getPlayTime()
    begin
      duration = @data[:items][0][:contentDetails][:duration]
      hour = duration.match(%r{(\d*)H}) || 0
      min = duration.match(%r{(\d*)M}) || 0
      sec = duration.match(%r{(\d*)S}) || 0
      play_time = hour[1].to_i * 360 + min[1].to_i * 60 + sec[1].to_i
      play_time
    rescue
      0
    end
  end

end
