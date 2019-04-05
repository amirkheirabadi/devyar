Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get '/category/:name', to: 'home#category'


  # AuthController
  get '/auth', to: 'auth#signin'
  post '/auth', to: 'auth#signin'

end
