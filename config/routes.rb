Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root GET    /                    toppages#index
  #login GET    /login(.:format)     sessions#new
  #POST   /login(.:format)     sessions#create
  #logout DELETE /logout(.:format)    sessions#destroy
  #signup GET    /signup(.:format)    users#new
  #users GET    /users(.:format)     users#index
  # POST   /users(.:format)     users#create
  #user GET    /users/:id(.:format) users#show
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
end
