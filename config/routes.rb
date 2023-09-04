Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get '/users/profile', to: 'users#profile'
  patch '/users/profile', to: 'users#update_profile'
  resources :users, only: [:show] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :products do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end
