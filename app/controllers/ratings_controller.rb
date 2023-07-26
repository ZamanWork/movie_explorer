class RatingsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.new(rating_params)
    @rating.user = 'user123'

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @movie, notice: 'Rating was successfully added.' }
        format.json { render json: @rating, status: :created }
      else
        format.html { redirect_to @movie, alert: 'Rating could not be added.' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.find(params[:id])

    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @movie, notice: 'Rating was successfully updated.' }
        format.json { render json: @rating, status: :ok }
      else
        format.html { redirect_to @movie, alert: 'Rating could not be updated.' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
