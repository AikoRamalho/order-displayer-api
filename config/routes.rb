Rails.application.routes.draw do
  resources :orders
  post 'auth/login' , to: "authentication#authenticate"
  post 'signup', to: 'users#create'
end
