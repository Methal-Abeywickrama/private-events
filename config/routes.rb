Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  resources :home
  resources :events do
    resources :event_attendances do
      collection do
        post 'invite_participants', to: 'event_attendances#invite_participants'
      end
    end
    
  end
  

  # Defines the root path route ("/")
  # root "posts#index"
end
