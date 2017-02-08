Rails.application.routes.draw do
  devise_for :users
  # add line bellow when recaptcha is implemented
  # , controllers: { registrations: "registrations" }

  root "leagues#index"

  resources :leagues, only: [:index, :show] do
    resources :teams
  end

  resources :users, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end

  resources :teams, only: [:index, :show] do
    resources :players, only: [:index, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :players
      resources :team_players
    end
  end
end
