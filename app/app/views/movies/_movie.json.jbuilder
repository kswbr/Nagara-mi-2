json.extract! movie, :id, :title, :url, :feed_id, :movie_type_id, :image, :publish, :movie_id, :play_time, :site_id, :site_type_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
