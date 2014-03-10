NewToTown::Application.routes.draw do


  devise_for :users
resources :users, :sessions, :spots
get "/spots/:id", to: "spots#view_user_spot"


root to: "site#index"

get '/signup' => 'users#new'
delete '/signout', to: 'sessions#destroy'
get'/signin' => 'sessions#new'
post "/:yelp_id", to: "spots#add_to_user"
get "/:yelp_id", to: "spots#result", as: "business"
post "/spots/:id", to: "spots#update"

end
