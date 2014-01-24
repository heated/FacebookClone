FacebookClone::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]

  namespace :api, defaults: { format: :json } do
    resource :guests, :only => [:create]
    resources :users, :only => [:index, :show, :update]
    resources :private_messages, :only => [:show, :index, :create]
    resources :friends, :only => [:index, :create, :destroy]
    resources :friend_requests, :only => [:index, :create]
    resources :posts, :only => [:index, :show, :create]
    resources :comments, :only => [:create]
    resources :friends_suggestions, :only => [:index]
  end
  root :to => "root#root"
end