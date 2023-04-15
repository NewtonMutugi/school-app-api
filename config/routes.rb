# Rails.application.routes.draw do
#   devise_for :users,
#   controllers: {
#       sessions: 'users/sessions',
#       registrations: 'users/registrations'
#   }
# devise_scope :user do
#   post '/users/sign_up', to: 'users/registrations#create'
# end

#   namespace :api do
#     namespace :v1 do
#       resources :users do
#         resources :registrations, only: [:index, :create, :destroy]
#       end
#       resources :units
#       resources :tasks
#       resources :sessions, only: [:create, :destroy]
#       post 'users/login', to: 'users/sessions#new'
#     end
#   end
# end

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :units do
        resources :courses
      end

      devise_for :users, controllers: {
        registrations: 'api/v1/registrations',
        sessions: 'api/v1/sessions',
      }
      devise_scope :user  do
        resources :registrations, :sessions
        post '/users/sign_up', to: 'registrations#create'
        post '/users/login', to: 'sessions#create'
      end
      resources :tasks

      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      put '/users/:id', to: 'users#update'
      delete '/users/:id', to: 'users#destroy'
    end
  end
end
