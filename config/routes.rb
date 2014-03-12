NewToTown::Application.routes.draw do

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'sign-in' => 'devise/sessions#new', :as => :new_user_session
    post 'sign-in' => 'devise/sessions#create', :as => :user_session
    delete 'sign-out' => 'devise/sessions#destroy', :as => :destroy_user_session
    get 'users/:id' => 'devise/registrations#show', :as => :user
  end


  root to: "site#index"

  resources :spots
  get "/spots/:id", to: "spots#view_user_spot"
  post "/:yelp_id", to: "spots#add_to_user"
  get "/:yelp_id", to: "spots#result", as: "business"
  post "/spots/:id", to: "spots#update"

end
