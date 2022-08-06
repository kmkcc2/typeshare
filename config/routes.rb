Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "tweets#index"

  get '/tweet/:id/like', to: 'tweets#like', as: 'like'
  get '/tweet/:id/unlike', to: 'tweets#unlike', as: 'unlike'

end
