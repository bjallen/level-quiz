Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }
  resources :quiz_guesses, only: [:new, :create, :show]
  resources :behaviors
  resources :levels
  resources :competencies
  resources :pillars
  get "auth/:provider/callback", to: "sessions#create"
  get "/login", to: "sessions#new"
  root "quiz_guesses#new"
end
