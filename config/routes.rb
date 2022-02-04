Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  root to: 'cabins#index'
  resources :cabins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
