Rails.application.routes.draw do
  resources :users, only: %i[index edit update] do
    member do
      get :profile
    end
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "home#index"
end
