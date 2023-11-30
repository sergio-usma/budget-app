Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :categories do
    resources :movements
  end
end
