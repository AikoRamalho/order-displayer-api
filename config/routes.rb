Rails.application.routes.draw do
  
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :orders, only: :index
  end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :orders
  end
  
  post 'auth/login' , to: "authentication#authenticate"
  post 'signup', to: 'users#create'
end
