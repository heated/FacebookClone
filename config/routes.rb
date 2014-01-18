FacebookClone::Application.routes.draw do
  resources :users, :only => [:index, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :private_messages, :only => [:index, :create]
  resources :friends, :only => [:index, :create, :destroy]
  resources :posts, :except => [:new, :edit] do
    resources :comments, :except => [:new, :show]
  end
  root :to => "root#root"
end