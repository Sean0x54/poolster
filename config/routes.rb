Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pools, except: [:index] do
    #resources :entries
  end
  root to: "welcome#index"
end
