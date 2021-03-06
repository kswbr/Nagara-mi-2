class Site < ApplicationRecord
  validates :name, :presence => true
  validates :url, :presence => true ,:uniqueness => true
  belongs_to :site_type
  # has_one :favicon
  has_many :feeds
  # has_many :movies

  scope :has_movies, ->() {
    joins(feeds: :movies).where("movies.id IS NOT NULL").distinct
  }

end
