class Api::SiteController < ApplicationController
  def index
    render :json => Site.all
  end
end
