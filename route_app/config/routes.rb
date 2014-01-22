# RouteApp::Application.routes.draw do

# end

### ROUTES.rb 
# this is where we define our homepage
# plane = controller #index = some method
# interchangable with :to  =>"planes#index"
# you can also say root to: "planes#index" instead of get "/", to: "planes#index"

### ROUTES.rb
RouteApp::Application.routes.draw do
    # create our root route
    # get "/", :to  => "planes#index"
 
    root to: "planes#index"
    
    get "/planes", to: "planes#index"
    
    #define a route for making a new plane
    get "/planes/new", to: "planes#new"

    get "/planes/:id", to: "planes#show"
    # make sure /plane/:id is after /plane/new to avoivd
    # error where id is looking for id in "new"

    get "/planes/:id/edit", to: "planes#edit"

    post "/planes", to: "planes#create"

    put "/planes/:id", to: "planes#update"
end


