Rails.application.routes.draw do

  root 'users#show'

  devise_for :users
  
  resources :users, only: [:show] 
  resources :invitations, only: [:create, :destroy]
  resources :rosters, only: [:destroy]
  resources :teams, only: [:create, :show, :destroy]
  resources :tasks, only: [:create, :update, :destroy, :edit]
  
end
