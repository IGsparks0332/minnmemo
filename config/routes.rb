Rails.application.routes.draw do

  get 'rooms/show'

  devise_for :users
  root 'top#index'
  resources :sentences, only: %i(new create index destroy show edit update) do
    resources :reactions, only: %i(destroy create)
  end


  resources :users, only: %i(show) do
    resources :reactions, only:%i(index)
  end
  resources :chat, only: %i(create show)
  resources :matching, only: %i(index)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
