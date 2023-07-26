class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    if params[:title].present?
      @movie_data = OmdbService.search_movie_by_title(params[:title])
    else
      @movie_data = nil
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @rating = @movie.ratings.find_by(user: 'user123')

    @comments = @movie.comments.order(created_at: :desc)
  end
end
