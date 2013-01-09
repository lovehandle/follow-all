FollowAll::Application.routes.draw do
  root to: 'welcome#index'

  namespace :twitter do
    match "lists",       to: "lists#index",  as: "twitter_lists"
    match "list/follow", to: "lists#follow", as: "twitter_list_follow"
    match "list/users",  to: "lists#users",  as: "twitter_list_users"
  end

  #TODO: DELETE ME
  get "twitter_show", to: "welcome#twitter_show"

  get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'
  get '/list', to: 'sessions#show', as: 'show'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
  resources :follows
end
