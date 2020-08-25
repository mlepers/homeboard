Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :comments, only: [ :create ]
  end

  resources :residences, only: [ :show ] do
    get '/profiles', to: 'profiles#index'
    get '/profiles/:id', to: 'profiles#show'
  end
end
