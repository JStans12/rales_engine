Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      namespace :transactions do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      namespace :customers do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          get "/transactions", to: "transactions#index"
          get "/invoice_items", to: "invoice_items#index"
          get "/items", to: "items#index"
          get "/customer", to: "customers#show"
          get "merchant", to: "merchants#show"
        end
      end
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
