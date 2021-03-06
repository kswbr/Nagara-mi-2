class Movie < ApplicationRecord
  belongs_to :feed
  # belongs_to :movie_type

  validates :title, :presence => true
  validates :url, :presence => true ,:uniqueness => true

  scope :published, -> {where(publish:true)}
  scope :paginated_entries, ->(page) {
    page = page.to_i
    joins(:feed).order("feeds.published DESC").order("id DESC").offset(page * 20).limit(20)
  }
  scope :has_site_id, ->(id) {
    joins({:feed => :site}).where(:sites => {:id => id})
  }
  before_save do |movie|
    if (movie.publish == true)
      movie.publish = movie.play_time != nil && (movie.play_time < 30 || movie.play_time > 600) ? false : true
    end
  end

end
