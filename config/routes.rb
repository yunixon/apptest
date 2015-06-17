Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :uploads, except: [:index]
  end
  get '*any', to: 'errors#not_found', via: :all
  root to: 'home#index'
end
