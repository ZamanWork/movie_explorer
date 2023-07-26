class MoviesController < ApplicationController
  def search
    if params[:title].present?
      @movie_data = OmdbService.search_movie_by_title(params[:title])
    else
      @movie_data = nil
    end
  end
end
