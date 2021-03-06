Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :companies, only: [:index, :show, :create, :update]
      get '/company', to: 'companies#auth'
      namespace :companies do
        post '/:id/products', to: 'products#create'
        put '/:id/products/:product_id', to: 'products#update'
      end
      namespace :products do
        post '/:id/ingredients', to: 'ingredients#create'
      end
      resources :ingredients, only: [:update]
    end
  end
end
