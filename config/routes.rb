Rails.application.routes.draw do
  
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create] 
  resources :tasks
end
