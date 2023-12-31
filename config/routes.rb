Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
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
  end
  resources :comments, only: [:create, :destroy]
  resources :categories, only: [:show]
  resources :inquiries, only: [:new, :create] do
    collection do
      post :confirm
    end
  end
end
