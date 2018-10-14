class Movie < ApplicationRecord
  belongs_to :feed
  belongs_to :site
  belongs_to :movie_type
  belongs_to :site_type

  validates :title, :presence => true
  validates :url, :presence => true ,:uniqueness => true
  validates :feed_id, :presence => true
  after_initialize :init

  scope :random, -> {order("RANDOM()")}
  scope :published, -> {where(publish:true).joins(:feed).where("feeds.id is not null").joins(:site).where("sites.id is not null")}
  scope :paginated_entries, ->(page) {
    page = page.to_i
    joins(:feed).order("feeds.published DESC").order("id DESC").offset(page * 9).limit(9)
  }
  scope :recent_random, ->(count){
    data = joins(:feed).order("feeds.published DESC").limit(count)
    offset_count = data.count
    data.offset(rand(offset_count))
  }
  scope :category, ->(type,type_id) {

    return if (type.nil? || type_id.nil?)

    case type
    when "site" then
      joins(:feed).joins(:site).where("sites.id = #{type_id}")
    when "genre" then
      joins(:feed).joins(:site).where("sites.site_type_id = #{type_id}")
    when "media" then
      where("movie_type_id = #{type_id}")
    end

  }

  def init
    self.movie_type_id  ||= 1
    self.publish = true if (self.publish == nil)
    self.movie_id  ||= nil
    self.play_time  ||= nil

    self.site_id ||= self.feed.present? ? self.feed.site_id : nil
    self.site_type_id ||= self.site.present? ? self.site.site_type_id : nil

  end

  before_save do |movie|
    movie.publish = movie.play_time != nil && (movie.play_time < 30 || movie.play_time > 600) ? false : true
    movie.movie_id = self.parseYoutubeId(movie.url) if (movie.movie_type_id == 1)
  end

  def self.parseYoutubeId(url)
     str = url.match(%r{.*embed/([\w\-]+).*})
     return str[1] if (str.present? && str[1])
  end

  def self.execYoutubeDataApi(id)

    id = parseYoutubeId(id) if (id.include?("embed/"))

    api_url = "https://www.googleapis.com/youtube/v3/videos"
    api_key = "APIKEYAPIKEYAPIKEY"
    part = "snippet,contentDetails,statistics,status"

    uri = URI.parse("#{api_url}?id=#{id}&key=#{api_key}&part=#{part}")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json, {:symbolize_names => true})
    result
  end

  def self.getYoutubeThumbnails(data,key)
    begin
      data[:items][0][:snippet][:thumbnails][key]
    rescue
      nil
    end
  end

  def self.getYoutubePlayTime(data)
    begin
      duration = data[:items][0][:contentDetails][:duration]
      hour = duration.match(%r{(\d*)H}) || 0
      min = duration.match(%r{(\d*)M}) || 0
      sec = duration.match(%r{(\d*)S}) || 0
      play_time = hour[1].to_i * 360 + min[1].to_i * 60 + sec[1].to_i
      play_time
    rescue
      0
    end
  end

  def self.getYoutubeId(url)
    movies = getYoutubeUrl(url)
    movies.map! {|movie| parseYoutubeId(movie)}
  end

end
