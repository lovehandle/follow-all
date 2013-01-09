FollowAll::Application.routes.draw do
  root to: 'welcome#index'

  namespace :twitter do
    match "lists",       to: "lists#index",  as: "twitter_lists"
    match "user/lists",  to: "users#lists",  as: "twitter_user_lists"
    match "list/follow", to: "lists#follow", as: "twitter_list_follow"
    match "list/users",  to: "lists#users",  as: "twitter_list_users"
  end

  #TODO: DELETE ME
  get "twitter_show", to: "welcome#twitter_show"

  get '/auth/twitter/callback', to: 'twitter/sessions#create', as: 'callback'
  get '/auth/failure', to: 'twitter/sessions#error', as: 'failure'
  get '/list', to: 'twitter/sessions#show', as: 'show'
  delete '/signout', to: 'twitter/sessions#destroy', as: 'signout'
  resources :follows
end
