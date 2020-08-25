Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :comments, only: [ :create ]
  end

  resources :residences, only: [ :show ]
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show', as: :profile
  get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profiles/:id', to: 'profiles#update'
  
  resources :chatrooms, only: [ :show, :create, :new ] do
    resources :messages, only: [ :create ]
  end

end
