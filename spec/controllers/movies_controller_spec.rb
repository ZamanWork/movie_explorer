require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { create(:movie) }
  let(:valid_params) { attributes_for(:movie) }
  let(:invalid_params) { attributes_for(:movie, title: nil) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: movie.id }
      expect(response).to be_successful
    end
  end

end
