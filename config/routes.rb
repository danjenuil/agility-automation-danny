Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'site#index'

  resources :agility_automations, only: :create

  get '/submitted', to: 'agility_automations#submission_confirmation'
end
