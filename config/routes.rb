# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookings
  root to: 'cabins#index'
  resources :cabins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
