Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root "league#index"
  
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
