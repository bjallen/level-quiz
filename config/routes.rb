Rails.application.routes.draw do
  resources :behaviors
  resources :levels
  resources :competencies
  resources :pillars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
