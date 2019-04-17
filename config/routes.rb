Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "sessions#new"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/add-categories", to: "categories#new"
    resources :users
    resources :categories
  end
end
