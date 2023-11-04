Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  devise_for :users
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    root 'categories#splash', as: :unauthenticated_root
  end

  resources :categories, only: %i[index new  create destroy] do
    resources :expenses, only: [:index, :new, :create, :destroy]
  end
end