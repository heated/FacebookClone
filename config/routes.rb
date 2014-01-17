FacebookClone::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :private_messages, :only => [:index, :create]
  resources :friends, :only => [:index, :create, :destroy]
  resources :posts, :except => [:new, :edit] do
    resources :comments, :except => [:index, :show]
  end
  root :to => "sessions#index"
end