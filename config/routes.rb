# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  
  namespace :admin do
      resources :users
      resources :articles
      resources :categories
      resources :comments
      resources :conversations
      resources :events
      resources :likes
      resources :messages
      resources :models
      resources :posts
      resources :user_categories

      root to: "users#index"
    end

  resources :posts, path: 'publications' do
    resources :post_pictures, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update]
  end

  resources :users, path: 'profil', only: [:show, :update, :edit, :destroy, :index]
  resources :articles, only: [:index, :show]
  resources :events, only: [:index]

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  root 'home#index'
end
