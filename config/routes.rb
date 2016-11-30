Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/merchants/find', to: '/api/v1/merchants/search#show'
      get '/merchants/most_revenue', to: '/api/v1/merchants/most_revenue#show'
      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
          get '/revenue', to: 'revenue#show'
        end
      end

      get '/transactions/find', to: '/api/v1/transactions/search#show'
      resources :transactions, only: [:index, :show]

      get '/customers/find', to: '/api/v1/customers/search#show'
      resources :customers, only: [:index, :show]

      get '/items/find', to: '/api/v1/items/search#show'
      resources :items, only: [:index, :show]

      get '/invoices/find', to: '/api/v1/invoices/search#show'
      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          get '/customer', to: 'customers#show'
          get '/merchant', to: 'merchants#show'
        end
      end

      get '/invoice_items/find', to: '/api/v1/invoice_items/search#show'
      resources :invoice_items, only: [:index, :show]
    end
  end

end
