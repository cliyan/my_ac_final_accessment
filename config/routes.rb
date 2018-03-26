Rails.application.routes.draw do
  devise_for :users
  
  root to: "notes#index"

  resources :notes do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    member do
      get :followings, :followers
    end
    root to: "notes#show"
  end
  
end
