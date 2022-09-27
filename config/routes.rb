Rails.application.routes.draw do
  root 'sessions#welcome'
  resources 'users', only: [:new, :create, :index]
  resources 'sessions', only: [:new, :create, :destroy]
  resources 'art_works', except: [:index]
end
