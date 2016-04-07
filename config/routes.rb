Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  get '/' => 'root#index'
  resources :apidocs, only: [:index]
  namespace :api do
    namespace :v1 do
      get '/me' => 'users#me'
    end
  end
end
