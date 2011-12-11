Dreamforge::Application.routes.draw do
  devise_for :users

  resources :forums, :only => [:show, :index]
  resources :categories
  resources :topics, :only => [:show]
  resources :posts, :only => [:create]

  root :to => "static_pages#home"
end
