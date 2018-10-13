json.extract! site, :id, :name, :url, :site_type_id, :favicon_id, :created_at, :updated_at
json.url site_url(site, format: :json)
