Rails.application.routes.draw do
  devise_for :users
  
  root to: "notes#index"

  resources :notes

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    member do
      get :followings, :followers
    end
  end
  
end
