Rails.application.routes.draw do
  root 'pages#home'
  namespace :api, defaults: { format: :json } do
    resources :quotes, only: %i(show)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
