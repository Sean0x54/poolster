Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pools do
    get 'join', on: :member
    resources :entries
  end
  resources :pool_memberships
  root to: "welcome#index"
end
