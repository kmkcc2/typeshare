Rails.application.routes.draw do
  get 'users/index'
  get '/users/show/:id', to: 'users#show', as: 'show_user'


  devise_for :users
  resources :tweets do 
    resources :comments
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "tweets#index"

  get '/tweet/:id/like', to: 'tweets#like', as: 'like'
  get '/tweet/:id/unlike', to: 'tweets#unlike', as: 'unlike'
  get '/tweets/:tweet_id/comments/:id', to: 'comments#destroy', as: 'delete_comment'

end
