Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'root#index'
  namespace :api do
    namespace :v1 do
      resources :books do
        resources :rents
        post 'unbook', to: 'rents#unbook'
        post 'unrent', to: 'rents#unrent'
      end
      get '/index', to: 'home#index'
      resources :bicycle
    end
  end

end
