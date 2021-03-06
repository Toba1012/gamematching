Rails.application.routes.draw do
  get 'chats/new'
  get 'groups/new'
  get 'users/index'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :topics
  resources :relationships, only: [:create, :destroy]
  resources :groups
  resources :notifications, only: [:index, :destroy]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create'
  
  get '/chats/:group_id/new', to: 'chats#new', as: 'chats'
  post '/chats/:group_id/create', to: 'chats#create', as: 'chats_create'
  
  get '/group_users/:id/new', to: 'group_users#new', as: 'group_users'
  post '/group_users/:id/create', to: 'group_users#create', as: 'group_users_create'
end
