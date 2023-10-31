Rails.application.routes.draw do
  devise_for :users, controller: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
}
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'static_pages/splash'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
devise_scope :user do
  get '/users/sign_out', to: 'devise/sessions#destroy', as: :let_user_logout
end

resources :categories do
  resources :purchases
end
resources :categorypurchases
root to: 'static_pages#splash'

end