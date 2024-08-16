Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout
  resources :users
  resources :learning_histories, only: %i[index new create show edit update destroy] do
    member do
      patch :complete
      patch :incomplete
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  # Defines the root path route ("/")
  # root "articles#index"
end
