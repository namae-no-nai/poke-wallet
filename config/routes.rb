Rails.application.routes.draw do
  devise_for :investors

  resources :home, only: %i[index create destroy]

  get '/logs', to: 'home#logs'

  root to: 'home#index'
end
