Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get "/about", to: 'pages#about'
  root to: 'pages#home'
  resources :chat_rooms, only: [:show, :index, :new] do
    resources :messages, only: [:create]
    get "/rating", to: 'chat_rooms#rating', as: :rating
    post "/close", to: 'chat_rooms#close', as: :close
  end

  resources :users, only: [:show]

  resources :senseis, only: [:new, :create, :index, :show] do
    resources :agendas, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :sensei_subjects, only: [:new, :create, :index]
    get '/sensei_subjects/price', to: 'sensei_subjects#price'
  end

  resources :sensei_subjects, only: [:destroy]

  resources :subjects, only: [:index]

  resources :lesson_requests, only: [:new, :create, :show, :index, :destroy] do
    get "/sensei_accepted", to: 'lesson_requests#sensei_accepted'
  end

  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
