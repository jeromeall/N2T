NewToTown::Application.routes.draw do

resources :users, :sessions, :spots
get "/:yelp_id", to: "spots#show", as: "business"
root to: "site#index"

get '/signup' => 'users#new'
delete '/signout', to: 'sessions#destroy'
get'/signin' => 'sessions#new'

end
