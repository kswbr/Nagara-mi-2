class Api::SiteController < ApplicationController
  def index
    render :json => Site.has_movies
  end
end
