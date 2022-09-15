Rails.application.routes.draw do
  devise_for :investors

  root to: 'home#index'
end
