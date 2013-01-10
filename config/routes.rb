FollowAll::Application.routes.draw do
  root to: 'welcome#index'

  namespace :twitter do
    get  "user/lists",       to: "users#lists",      as: "twitter_user_lists"
    post "users/follow_all", to: "users#follow_all", as: "twitter_list_follow_all"
    get  "list/users",       to: "lists#users",      as: "twitter_list_users"
  end

  get '/auth/twitter/callback', to: 'twitter/sessions#create', as: 'callback'
  get '/auth/failure', to: 'twitter/sessions#error', as: 'failure'
  get '/list', to: 'twitter/sessions#show', as: 'show'
  delete '/signout', to: 'twitter/sessions#destroy', as: 'signout'
  resources :follows
end
