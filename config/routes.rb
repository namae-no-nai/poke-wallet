Rails.application.routes.draw do
  devise_for :investors

  resources :home, only: %i[index create]

  root to: 'home#index'
end
