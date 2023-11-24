Rails.application.routes.draw do
  namespace :api do
    resources :destination_weather, only: [:index]
  end

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
