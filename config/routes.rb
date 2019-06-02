Rails.application.routes.draw do
  devise_for :admin_users
  ActiveAdmin.routes(self)
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root 'root#index'
  namespace :api do
    namespace :v1 do
      resources :bicycles do
        resources :rents
        post 'unbook', to: 'rents#unbook'
        post 'unrent', to: 'rents#unrent'
        post 'finish_rent', to: 'rents#finish_rent'
      end
      get '/index', to: 'home#index'
      get '/bicycle/map', to: 'bicycle#map'
      resources :bicycle

    end
  end
end
