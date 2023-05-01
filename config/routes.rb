Rails.application.routes.draw do
  resources :audio, only: :create
end
