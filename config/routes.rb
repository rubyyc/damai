Rails.application.routes.draw do

  devise_for :users

  resources :events do
    # resources :registrations
    resources :registrations do
      member do
        get "steps/2" => "registrations#step2", :as => :step2
        patch "steps/2/update" => "registrations#step2_update", :as => :update_step2
        get "steps/3" => "registrations#step3", :as => :step3
        patch "steps/3/update" => "registrations#step3_update", :as => :update_step3
        get "steps/1" => "registrations#step1", :as => :step1
        patch "steps/1/update" => "registrations#step1_update", :as => :update_step1
      end
    end
  end

  namespace :admin do

    resources :versions do
      post :undo
    end


  root "events#index"
    resources :events do
      resources :registrations, :controller => "event_registrations"
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
