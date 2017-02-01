Rails.application.routes.draw do
  devise_for :users
  # add line bellow when recaptcha is implemented
  # , controllers: { registrations: "registrations" }

  root "leagues#index"

  resources :leagues, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end

  resources :users, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end

  resources :teams, only: [:index, :show] do
    resources :players, only: [:index, :show]
  end
end
