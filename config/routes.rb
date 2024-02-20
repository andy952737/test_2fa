Rails.application.routes.draw do
  get 'user_mfa_sessions/new'
  post 'user_mfa_sessions/create'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations', 
        sign_out: 'users/destroy'
  }
  # devise_for :users, controllers: { 
  #   sign_in: 'user/sessions',
  #   registrations: 'user/registrations'
  # } 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #get 'public/index'
  root "public#index"
end
