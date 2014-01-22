 # We need to create a controller
 # PlanesController for planes

 # ApplicationController inherits from ActionController
 
class PlanesController < ApplicationController
    
    def index
        # render text: "Hello, pilots!"
        @planes = Plane.all  

        # assign all instances of Plane to @planes
        # Plane.all is like SELECT * FROM table Plane

        render :index
    end
    
    def new
        render :new
    end

    def create
		# .require is better but you can write => plane = params[:plane].permit(:name, :engine_type, :description)
		
		plane = params.require(:plane).permit(:name, :engine_type, :description)

		# we get the above from the form we've created. in each form we've put plane[some_name]
		# therefore we can grab the :plane to grab the whole hash => .require(:plane)
		# the important part is the .permit => allows to grab only the information stated in the ()

	    new_plane = Plane.create(plane)
	    redirect_to "/planes/#{new_plane.id}"

    end

    # PLAN FOR SUBMITTING  A NEW PLANE
## 1.) we want to submit a "POST" to "/planes"
#       b). Route the "POST" to "PlanesController" 
#          send it to the "#create" 
# 2.) In the create
#       a) read the params for the plane
#       b.) save the plane to our database 
# 3.) Sending redirect to the "#index" method
# .permit(:name, :engine_type, :description) is needed in Rails 4 to pass the params 
    
    def show 
        id = params[:id] # id is part of the route so we can grab the params[:id]
        @plane = Plane.find(id)

        render :show
    end

    # def edit
    #     id = params[:id]
    #     @plane = Plane.find(id)
    #     render :edit
    # end

    # def update  # get the information from the edit form and set it to updated_info and pass to update
    #     id = params[:id]
    #     plane = Plane.find(id)        
    #     updated_info = params.require(:plane).permit(:name, :engine_type, :description)
    #     plane.update_attributes(updated_info)
    #     redirect_to "/planes/#{plane.id}"
    # end
	

end






