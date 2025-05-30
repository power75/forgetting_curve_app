# frozen_string_literal: true

Rails.application.routes.draw do
  post '/callback', to: 'line_bot#callback'
  get 'oauths/oauth'
  get 'oauths/callback'
  get 'how_to_use', to: 'static_pages#how_to_use'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'dashboard', to: 'dashboards#dashboard'
  get 'notifications/index'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  # config/routes.rb
  resources :password_resets, only: %i[create edit update new]
  resources :users
  resources :quizzes do
    get :autocomplete, on: :collection
  end
  resources :learning_histories do
    get :autocomplete, on: :collection
    member do
      patch :complete
      patch :incomplete
    end
  end
  resources :notifications, only: [:index]
  resources :contacts, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  # Defines the root path route ("/")
  # root "articles#index"

  # LINEテスト用ルート
  get 'line/test_push', to: 'line_test#test_push'
end
