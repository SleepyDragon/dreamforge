Dreamforge::Application.routes.draw do
  devise_for :users
  
  resources :forums
  
  root :to => "static_pages#home"
end
