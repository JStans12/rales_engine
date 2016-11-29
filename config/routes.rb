Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
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
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
