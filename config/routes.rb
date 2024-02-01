Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/users/:id', to: 'users#show'

  patch '/users/:id/activate', to: 'users#activate'

  patch '/users/:id/deactivate', to: 'users#deactivate'

  get '/posts', to: 'posts#index'

  get '/posts/:id', to: 'posts#show'

  post '/posts/:id', to: 'posts#create'
end
