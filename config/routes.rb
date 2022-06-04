Rails.application.routes.draw do
  resources :quiz_guesses, only: [:new, :create, :show]
  resources :behaviors
  resources :levels
  resources :competencies
  resources :pillars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "quiz_guesses#new"
end
