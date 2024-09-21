Rails.application.routes.draw do
  
  #get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

  resources :tweets do
    resources :tweets, only: [:edit, :update]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    
  end

  get 'tweets/index' => 'tweets#index' 

  get 'tweets/new' => 'tweets#new'

  post 'tweets' => 'tweets#create'

  get 'tweets/:id' => 'tweets#show',as: 'tweet_show'

patch 'tweets/:id' => 'tweets#update'
  get 'tweets/:id/edit' => 'tweets#edit', as:'doedit_tweet'

  root 'top#index' 

  get 'about/index' => 'about#index'

  get 'users/index' => 'users#index'

  get 'users/new' => 'users#new'


end
