Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'

  resources :users, only: [ :destroy, :update ]
  resources :bikes do
    resources :rentals, only: [ :new, :create ]
    #in case we want to add reviews
    #resources :reviews, only: [ :new, :create ]
  end
  resources :rentals, only: [ :show, :update, :index ]
end
