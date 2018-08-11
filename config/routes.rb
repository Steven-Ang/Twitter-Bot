Rails.application.routes.draw do

  get '/' => "welcome#index", as: "root"
  get "/auth/:provider/callback" => "sessions#create_twitter"
  get "auth/failure" => "/"
  get '/sign_up' => 'users#new'
  get "sign_out" => "sessions#destroy", as: "signout"
  get 'users/:id' => "users#show", as: "show_user"

  get '/sign_in' => 'sessions#new'
  post '/sign_in' => 'sessions#create'
  post '/users' => 'users#create'

  resources :tweets

  post "/" => "tweets#create"
  post "/users/:id" => "tweets#create"

end
