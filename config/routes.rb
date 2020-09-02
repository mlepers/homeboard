Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :comments, only: [ :create, :destroy ]
  end

  resources :residences, only: [ :show ]
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show', as: :profile
  get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profiles/:id', to: 'profiles#update'

  resources :chatrooms, only: [ :index, :show, :create, :new ] do
    resources :messages, only: [ :create ]
  end

  resources :info_syndics, only: [ :new, :create, :update ]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
