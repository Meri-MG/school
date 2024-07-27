Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "home#index"

  resources :sponsor_students
  resources :school_inventories
  resources :sponsored_students, only: %i[index]
  get 'donate/how_to_donate', to: 'donations#how_to_donate', as: 'how_to_donate'
  get 'sponsor_student/:id/sponsor_individual_student', to: 'sponsor_students#sponsor_individual_student', as: 'sponsor_individual_student'
end
