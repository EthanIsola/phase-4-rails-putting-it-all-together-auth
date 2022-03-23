Rails.application.routes.draw do
  post "/signup", to: "user#create"
  post "/login", to: "session#create"
  post "/recipes", to: "recipes#create"
  get "/recipes", to: "recipes#index"
  delete "/logout", to: "session#destroy"
  get "/me", to: "user#show"
end
