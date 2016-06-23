RottenMangoes::Application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resource :session, only: [:new, :create, :destroy]

  root to: 'movies#index'

  resources :users, only: [:new, :create] 

  namespace :admin do
    resources :users, only: [:index, :edit, :show, :update, :destroy]
  end

end
