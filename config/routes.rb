Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: "items#index"
  resources :cards, only: [:new, :create, :show]
  resources :items do
    resources :buyers, only: [:index, :create]
  end
end
