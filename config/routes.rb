Rails.application.routes.draw do
  # Auth

  # Dashboard
  namespace :dashboard do
    get "/", to: "main#index"
  end

  match "/auth" => "auth#signin", via: [:get, :post]
  match "/auth/signup" => "auth#signup", via: [:get, :post]
  get "/auth/signout", to: "auth#signout"
  get "/auth/verification/:email/:code", to: "auth#verification"

  root to: "home#index"
end
