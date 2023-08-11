Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :sponsor_students, only: %i[index new create show edit update destroy]
  get 'donate/how_to_donate', to: 'donations#how_to_donate', as: 'how_to_donate'

end
