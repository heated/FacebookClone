FacebookClone::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]
  
  namespace :api, defaults: { format: :json } do
    resources :users, :only => [:show]
    resources :private_messages, :only => [:show, :index, :create]
    resources :friends, :only => [:index, :create, :destroy]
    resources :friend_requests, :only => [:index, :create, :destroy]
    resources :posts, :except => [:new, :edit]
    resources :comments, :except => [:new, :show, :edit]
  end
  root :to => "root#root"
end