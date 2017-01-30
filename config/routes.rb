Rails.application.routes.draw do
  root "home#index"
  resources :leagues, only: [:index]
end
