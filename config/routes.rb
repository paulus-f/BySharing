Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'root#index'
  namespace :api do
    namespace :v1 do
      get '/index', to: 'home#index'
    end
  end
end
