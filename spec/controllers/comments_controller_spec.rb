require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:movie) { create(:movie) }
  let(:valid_params) { { comment: { text: 'Great movie!' }, movie_id: movie.id } }
  let(:invalid_params) { { comment: { text: '' }, movie_id: movie.id } }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new comment' do
        expect {
          post :create, params: valid_params
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the movie show page' do
        post :create, params: valid_params
        expect(response).to redirect_to(movie)
      end
    end

    context 'with invalid params' do
      it 'does not create a new comment' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Comment, :count)
      end

      it 'redirects to the movie show page with an alert' do
        post :create, params: invalid_params
        expect(response).to redirect_to(movie)
        expect(flash[:alert]).to be_present
      end
    end
  end

end
