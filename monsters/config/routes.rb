Monsters::Application.routes.draw do


  root to: "monsters#index"

  get "/monsters", to: "monsters#index"

  get "/monsters/new", to: "monsters#new"

  get "/monsters/:id", to: "monsters#show"

  get "/monsters/:id/edit", to: "monsters#edit"

  post "/monsters", to: "monsters#create"
 
  put "/monsters/:id", to: "monsters#update"


end
