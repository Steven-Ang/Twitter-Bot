Rails.application.routes.draw do

  get '/' => "welcome#index", as: "root"

  get "/auth/:provider/callback" => "sessions#create_twitter"
  get "auth/failure" => "/"

  get '/sign_up' => 'users#new'
  get "sign_out" => "sessions#destroy", as: "signout"

  get 'users/:id' => "users#show", as: "show_user"
  get "users/:id/scheduled" => "users#scheduled", as: "scheduled_user_tweets"
  get "users/:id/sent" => "users#sent", as: "sent_user_tweets"
  post '/users' => 'users#create'

  get '/sign_in' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :tweets

  post "/" => "tweets#create"
  post "/users/:id" => "tweets#create"

end
