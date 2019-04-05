Rails.application.routes.draw do
  # Auth

  # Dashboard
  namespace :dashboard do
    get "/bot/create", to: "bot#create"
    match "/account" => "main#account", via: [:get, :post]

    get "/", to: "main#index"
  end

  match "/auth" => "auth#signin", via: [:get, :post]
  match "/auth/signup" => "auth#signup", via: [:get, :post]
  get "/auth/verification/:email/:code", to: "auth#verification"

  root to: "home#index"
end
