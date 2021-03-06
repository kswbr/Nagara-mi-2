Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/api/movies', to: 'api/movie#index'
  get '/api/sites', to: 'api/site#index'
end
