class Api::MovieController < ApplicationController
  def index
    @movies = Movie.published.paginated_entries(params[:page] || 0)
    render :json => @movies, :include => {:feed => {:include => :site}}
  end
end
