Rails.application.routes.draw do
  mount Motor::Admin => '/motor_admin'
  devise_for :users
  root "patient#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :patient

end
