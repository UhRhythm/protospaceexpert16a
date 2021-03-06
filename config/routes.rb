Rails.application.routes.draw do
  # devise_for :users, :controllers => {sessions: 'sessions'}
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :tags, only:[:show, :index]
  resources :prototypes
  resources :users, only: [:show, :edit, :update]
end

