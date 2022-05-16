Rails.application.routes.draw do


  get '/' => redirect { |params| 'http://localhost:3000/stations/1' }
  root to: 'stations#index'

  resources :vehicles
  resources :stations

  resources :locations, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
