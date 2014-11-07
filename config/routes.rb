Rails.application.routes.draw do

  root 'users#show'

  devise_for :users
  
  resources :users, only: [:show] 
  resources :invitations, only: [:create, :update, :destroy]

  resources :teams, only: [:create, :show, :destroy] do
    resources :rosters, only: [:create]
    resources :tasks, only: [:create]
  end



  # get "/teams/:id", to: "teams#show"

  # post "/teams/", to: "teams#create"

  # delete "/teams/:id", to: "teams#destroy"
  

  # delete "/invitations/:id", to: "invitations#destroy"

  # put "/invitations/:id", to: "invitations#update"

  # post "/invitations", to: "invitations#create"


  # "/teams/#{team.id}/rosters/#{holder}"

end
