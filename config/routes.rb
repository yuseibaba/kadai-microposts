Rails.application.routes.draw do
          #    Prefix Verb   URI Pattern               Controller#Action
          #      root GET    /                         toppages#index
          #     login GET    /login(.:format)          sessions#new
          #           POST   /login(.:format)          sessions#create
          #    logout DELETE /logout(.:format)         sessions#destroy
          #    signup GET    /signup(.:format)         users#new
#followings_user GET    /users/:id/followings(.:format) users#followings
#followers_user GET    /users/:id/followers(.:format)  users#followers
#   likes_user GET    /users/:id/likes(.:format)      users#likes
          #     users GET    /users(.:format)          users#index
          #           POST   /users(.:format)          users#create
          #      user GET    /users/:id(.:format)      users#show
          #microposts POST   /microposts(.:format)     microposts#create
          # micropost DELETE /microposts/:id(.:format) microposts#destroy
#relationships POST   /relationships(.:format)        relationships#create
  #relationship DELETE /relationships/:id(.:format)    relationships#destroy
#       favorites POST   /favorites(.:format)            favorites#create
#      favorite DELETE /favorites/:id(.:format)        favorites#destroy
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do #memberは:idをurlを加える、collectionは:idを加えない
      get :followings
      get :followers
      get :likes
    end
  end
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end