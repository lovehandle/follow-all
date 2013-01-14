FollowAll::Application.routes.draw do

  root to: 'welcome#index'

  namespace :twitter do
    get    "list",               to: "sessions#show",      as: "show"
    get    "auth/failure",       to: "sessions#error",     as: "failure"
    delete "signout",            to: "sessions#destroy",   as: "signout"
    get    "user/lists",         to: "users#lists",        as: "user_lists"
    post   "users/follow_users", to: "users#follow_users", as: "user_follow_users"
    get    "list/users",         to: "lists#users",        as: "list_users"
  end

  get '/auth/twitter/callback', to: 'twitter/sessions#create', as: 'callback'

end
