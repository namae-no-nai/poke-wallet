Rails.application.routes.draw do
  devise_for :investors

  resources :home, only: %i[index create destroy]

  root to: 'home#index'
end
