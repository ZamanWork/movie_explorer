class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    if params[:title].present?
      present_movie = Movie.where('lower(title) = ?', params[:title].downcase).first
      redirect_to present_movie if present_movie

      @movie_data = OmdbService.search_movie_by_title(params[:title])
    else
      @movie_data = nil
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @rating = @movie.ratings.find_by(user: 'user123')
    @new_rating = @movie.ratings.new() if @rating.blank?

    @comments = @movie.comments.order(created_at: :desc)
  end

  def create
    @movie_data = params[:movie_data]
    existing_movie = Movie.find_by(title: @movie_data['Title']) if @movie_data
    if existing_movie
      redirect_to existing_movie, alert: 'Movie already exists.'
    else
      @movie = Movie.new(title: @movie_data['Title'], release_year: @movie_data['Year'], plot: @movie_data['Plot'], poster_url: @movie_data['Poster'])
      respond_to do |format|
        if @movie.save
          format.html { redirect_to @movie, notice: 'Movie was successfully added.' }
          format.json { render json: @movie, status: :created }
        else
          format.html { redirect_to search_path(title: @movie.title), alert: 'Movie could not be added.' }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
