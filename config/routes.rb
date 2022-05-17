Rails.application.routes.draw do


  get '/' => redirect { |params| 'http://localhost:3000/stations/1' }
  root to: 'stations#index'

  resources :vehicles, only: [:index]
  resources :stations, only: [:show]

  resources :locations, only: [:new, :create]

  get '/:any_other_url'=> redirect { |params| 'http://localhost:3000/stations/1' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
