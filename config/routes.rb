Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'sessions/create'
 get 'sessions/create'

  get 'sessions/destroy'

  get 'home/index'
  get :search, controller: :home
  get '/' => 'home#index'
  get '/profile/:id' => "home#profile"

  post '/create_post_remote' => "home#create_post_remote"
  post '/comment_remote' => "home#comment_remote"
  post '/create_comment_remote' => "home#create_comment_remote"
  post '/like_remote' => "home#like_remote"
  post 'follow_remote' => "home#follow_remote"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :notifications do
    collection do
     post :mark_as_read
    end
  end

  root to: "home#show"

  get '/direct_messages/show_remote/:id' => "direct_messages#show_remote"
  
  mount ActionCable.server => '/cable'

end
