Rails.application.routes.draw do
  #get 'utasks/create'
  #get 'utasks/destroy'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  # get 'logins/index'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'toppages/index'
  # root to: 'toppages#index'
  
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
#  resources :users, only: [:index, :show, :new, :create] 
  resources :users, only: [:new, :create] 
  
  resources :tasks
#  resources :utasks, only: [:create, :destroy] 
end
