Rails.application.routes.draw do
  get 'static_pages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'static_pages/top'
  root 'static_pages#top'
  # Defines the root path route ("/")
  # root "articles#index"
end
