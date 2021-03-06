class Api::MovieController < ApplicationController
  def index
    if (params[:site] and params[:site].to_i > -1 ) then
      @movies = Movie.published.has_site_id(params[:site]).paginated_entries(params[:page] || 0)
    else
      @movies = Movie.published.paginated_entries(params[:page] || 0)
    end;
    render :json => @movies, :include => {:feed => {:include => :site}}
  end
end
