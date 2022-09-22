Rails.application.routes.draw do
  root 'sessions#welcome'
  # get 'sign_up', to: 'users#new'
  # post 'sign_up', to: 'users#create'
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # post 'logout', to: 'sessions#destroy'
  # get 'welcome', to: 'sessions#welcome'
  # get 'add_new_work', to: 'art_works#new'
  # post 'add_new_work', to: 'art_works#create'
  # get 'works', to: 'art_works#show'

  resources 'users', only: [:new, :create, :index]
  resources 'sessions', only: [:new, :create, :destroy]
  resources 'art_works', except: [:index]
end
