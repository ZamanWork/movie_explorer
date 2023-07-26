Rails.application.routes.draw do
  resources :movies, only: [:index, :search, :show] do
    resources :ratings, only: [:create, :update]
    resources :comments, only: :create
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
end
