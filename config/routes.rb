Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create] do
    resources :ratings, only: [:create, :update]
    resources :comments, only: :create
  end
  get '/search', to: 'movies#search', as: 'search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
end
