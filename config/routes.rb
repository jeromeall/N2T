NewToTown::Application.routes.draw do


  get "sessions/new"
  get "sessions/destroy"
resources :users, :sessions

get '/signup' => 'users#new'
delete '/signout', to: 'sessions#destroy'
get'/signin' => 'sessions#new'
root to: "site#index"
end
