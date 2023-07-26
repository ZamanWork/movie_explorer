class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to @movie, alert: 'Comment could not be saved.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
