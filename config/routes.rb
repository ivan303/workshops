Rails.application.routes.draw do

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'

  devise_for :users, controllers: { registrations: "users/registrations",
  									passwords: "users/passwords",
  									sessions: "users/sessions" }

  resources :users, only: [:show]
end
