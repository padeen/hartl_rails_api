Rails.application.routes.draw do
  resources :users
  resources :microposts, only: [ :create, :destroy ]
end
