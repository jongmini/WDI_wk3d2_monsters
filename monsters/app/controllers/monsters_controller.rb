#/monsters/app/controllers/monsters_controller.rb

class MonstersController < ApplicationController

	def index
		@monsters = Monster.all
		render :index
	end

	def new
		render :new
	end

	def create
		monster = params.require(:monster).permit(:name, :monster_type, :description)
		new_monster = Monster.create(monster)
		redirect_to "/monsters/#{new_monster.id}"
	end


	def show
		id = params[:id]
		@monster = Monster.find(id)
		render :show
	end

	def edit
		id = params[:id]
        @monster = Monster.find(id)
        render :edit
    end

	def update
		id = params[:id]
		monster = Monster.find(id)
		updated_monster = params.require(:monster).permit(:name, :monster_type, :description)
		monster.update_attributes(updated_monster)
		redirect_to "/monsters/#{monster.id}"
	end

end
