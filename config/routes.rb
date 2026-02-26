# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  resources :students do
    collection { get :sponsored }
  end
  get 'students/:id/sponsor_individual_student', to: 'students#sponsor_individual_student', as: 'sponsor_individual_student'
  get 'donate/how_to_donate', to: 'donations#how_to_donate', as: 'how_to_donate'
end
