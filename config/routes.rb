FacebookClone::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :private_messages, :only => [:index, :new, :create]
  resources :friends, :only => [:index, :create, :destroy]
  resources :posts do
    resources :comments, :except => [:index, :show]
  end
  root :to => "sessions#new"
end