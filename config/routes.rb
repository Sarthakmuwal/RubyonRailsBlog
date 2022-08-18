Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments

   
  end
  resources :users
 
  get "signup", to: "registrations#new"
  post "signup", to:  "registrations#create"
 
  delete "logout", to: "sessions#destroy"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

end   

