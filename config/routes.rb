FacebookClone::Application.routes.draw do
  resources :posts
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create, :show]
  resources :private_messages, :only => [:index, :new, :create]
  root :to => "sessions#new"
end