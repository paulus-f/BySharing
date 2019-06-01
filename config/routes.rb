Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'root#index'
  namespace :api do
    namespace :v1 do
      get '/index', to: 'home#index'
      get '/bicycle/map', to: 'bicycle#map'
      resources :bicycle

    end
  end

end
