json.extract! movie_type, :id, :title, :url, :created_at, :updated_at
json.url movie_type_url(movie_type, format: :json)
