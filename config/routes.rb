Rails.application.routes.draw do
  devise_for :investors

  root "home#index"
end
