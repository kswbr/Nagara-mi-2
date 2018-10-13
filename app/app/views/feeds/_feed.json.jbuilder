json.extract! feed, :id, :url, :title, :site_id, :published, :summary, :searched, :created_at, :updated_at
json.url feed_url(feed, format: :json)
