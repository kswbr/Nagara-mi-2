class Feed < ApplicationRecord
  belongs_to :site
  has_many :movies

  validates :title, :presence => true ,:uniqueness => true
  validates :url, :presence => true ,:uniqueness => true
  validates :site_id, :presence => true

  scope :latest, -> {order("published DESC").limit(1)}

  def self.saveFeed(site_id,entry)

    begin

      data = self.new

      data.title = entry.title
      data.summary = entry.summary
      data.url = entry.url
      data.published = entry.published
      data.site_id = site_id

      data.save

    rescue
      return false
    end

  end

end
