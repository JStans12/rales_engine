Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/most_revenue", to: "total_revenue#index"
        get "/most_items", to: "most_items#index"
        get "/revenue", to: "revenue_date#show"
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
        get "/most_revenue", to: "total_revenue#index"
        get "/most_items", to: "most_items#index"
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
          get "/invoice", to: "invoices#show"
        end
      end
      resources :customers, only: [:index, :show] do
        scope module: 'customers' do
          get "/invoices", to: "invoices#index"
          get "/transactions", to: "transactions#index"
          get "/favorite_merchant", to: "favorite_merchant#show"
        end
      end
      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          get "/items", to: "items#index"
          get "/invoices", to: "invoices#index"
          get "/revenue", to: "revenue#show"
          get "/favorite_customer", to: "favorite_customer#show"
          get "/customers_with_pending_invoices", to: "pending_invoices#index"
        end
      end
      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          get "/transactions", to: "transactions#index"
          get "/invoice_items", to: "invoice_items#index"
          get "/items", to: "items#index"
          get "/customer", to: "customers#show"
          get "merchant", to: "merchants#show"
        end
      end
      resources :items, only: [:index, :show] do
        scope module: 'items' do
          get "invoice_items", to: "invoice_items#index"
          get "merchant", to: "merchants#show"
          get "/best_day", to: "best_day#show"
        end
      end
      resources :invoice_items, only: [:index, :show] do
        scope module: 'invoice_items' do
          get "invoice", to: "invoices#show"
          get "item", to: "items#show"
        end
      end
    end
  end
end
