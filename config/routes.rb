Dreamforge::Application.routes.draw do
  devise_for :users
  
  resources :forums, :categories, :topics
  
  root :to => "static_pages#home"
end
