Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'new_name', to: 'users/registrations#new_name'
    post 'create_name', to: 'users/registrations#create_name'
  end
  root to: "items#index"
  resources :cards, only: [:new, :create, :show]
  resources :items do
    collection do
      get 'search'
      get 'searchransack'
    end
    resources :buyers, only: [:index, :create]
  end
end
