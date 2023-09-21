Rails.application.routes.draw do
  resources :movies, only: %i[index show]
  resources :production_companies, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
