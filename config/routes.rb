# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts do
    resources :post_pictures, only: [:create]
    resources :comments, only: [:create]
    resources :users, only: [:index, :show]
  end
  get '/welcome' => "posts#index", as: :user_root

  resources :users, only: [:show, :update, :edit, :destroy, :index] do
    resources :avatars, only: [:create]
  end

  resources :articles
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  
  root 'home#index'
end
