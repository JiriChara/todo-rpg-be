Rails.application.routes.draw do
  resources :tokens, only: [
    :create
  ]

  resources :me, only: [
    :index
  ]
end
