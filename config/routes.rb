FacebookClone::Application.routes.draw do
  resources :users, :only => [:new, :index, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :private_messages, :only => [:show, :index, :create]
  resources :friends, :only => [:index, :create, :destroy]
  resources :posts, :except => [:new, :edit]
  resources :comments, :except => [:new, :show, :edit]
  root :to => "root#root"
end