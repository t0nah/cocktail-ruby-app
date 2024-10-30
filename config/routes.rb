Rails.application.routes.draw do
  get "pages/about"
  resources :cocktails, only: [:index, :show] # Sets up /cocktails and /cocktails/:id routes
  resources :drinks, only: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about", as: :about

  # Defines the root path route ("/")
  root "cocktails#index"
end
