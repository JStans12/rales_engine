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
      resources :transactions, only: [:index, :show] do
        scope module: 'transactions' do
          get "/invoice", to: "invoice#show"
        end
      end
      resources :customers, only: [:index, :show] do
        scope module: 'customers' do
          get "/invoices", to: "invoices#index"
          get "/transactions", to: "transactions#index"
        end
      end
      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          get "/items", to: "items#index"
          get "/invoices", to: "invoices#index"
        end
      end
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
