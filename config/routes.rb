NewToTown::Application.routes.draw do

resources :users, :sessions, :spots, :searches
root to: "site#index"

# post "/", to: "searches#new"
get '/signup' => 'users#new'
delete '/signout', to: 'sessions#destroy'
get'/signin' => 'sessions#new'

end
