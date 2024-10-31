Rails.application.routes.draw do
  get "pages/about"
  resources :cocktails, only: [:index, :show]
  resources :drinks, only: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about", as: :about

  get '/search', to: 'search#index'
  # Defines the root path route ("/")
  root "cocktails#index"
end
