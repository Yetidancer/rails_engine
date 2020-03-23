Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find_one', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      namespace :items do
        get '/find_one', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      resources :merchants, except: [:new, :edit] do
        resources :items, only: [:index]
      end

      resources :items, except: [:new, :edit] do
        get '/merchant', to: 'merchants#show'
      end


    end
  end
end
