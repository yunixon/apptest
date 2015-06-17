Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :uploads, except: [:index]
  end
  root to: 'home#index'
end
