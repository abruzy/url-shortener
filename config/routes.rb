Rails.application.routes.draw do
  root to: 'homes#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: %i[create show]
      get '/:slug', to: 'links#show', as: :short
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
