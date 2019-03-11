Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :post_pictures, only: [:create]
  end

  resources :users, only: [:show, :update, :edit, :destroy, :index] do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
