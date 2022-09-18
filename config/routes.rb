Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
