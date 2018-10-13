Rails.application.routes.draw do
  resources :favicons
  resources :feeds
  resources :movie_types
  resources :movies
  resources :site_types
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
