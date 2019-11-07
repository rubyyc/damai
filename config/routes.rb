Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :registrations
  end

  namespace :admin do
    root "events#index"
    resources :events do
      collection do
        post :bulk_update
      end

      member do
        post :reorder
      end

    end
    resources :users
  end

  root "events#index"

  get "/faq" => "pages#faq"

  resource :user


end
