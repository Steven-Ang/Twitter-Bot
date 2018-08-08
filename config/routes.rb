Rails.application.routes.draw do
  get '/' => "welcome#index", as: "root"
  get "/auth/:provider/callback" => "sessions#create"
  get "auth/failure" => "/"
  get "signout" => "sessions#destroy", as: "signout"
end
