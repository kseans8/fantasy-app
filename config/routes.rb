Rails.application.routes.draw do
  devise_for :users
  # add line bellow when recaptcha is implemented
  # , controllers: { registrations: "registrations" }

  root "leagues#index"

  resources :leagues, only: [:index, :show] do
    resources :teams, only: [:index, :show] do
      resources :players, only: [:index, :show]
    end
  end

  resources :users do
    resources :teams do
      resources :players, only: [:index, :show]
    end
  end
end
