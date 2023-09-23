Rails.application.routes.draw do
  # get 'events/index'
  mount Motor::Admin => '/motor_admin'
  devise_for :users
  root "patient#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :home
  resources :patient
  resources :events, only: [:index, :create, :update, :destroy]

end
