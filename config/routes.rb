# frozen_string_literal: true

Rails.application.routes.draw do
  get 'notifications/index'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  # config/routes.rb
  resources :password_resets, only: %i[create edit update new]
  resources :users
  resources :quizzes
  resources :learning_histories do
    member do
      patch :complete
      patch :incomplete
    end
  end
  resources :notifications, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  # Defines the root path route ("/")
  # root "articles#index"
end
