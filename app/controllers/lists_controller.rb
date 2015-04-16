class ListsController < ApplicationController
	before_action :find_list,:only =>[:update,:edit,:destroy,:finish,:unfinish]

	def index
		@list = List.all

		if params[:commit] == "finish"
			@list = @list.where("dostate like ?","YES")
		elsif params[:commit] == "unfinish"
			@list = @list.where("dostate like ?","NO")
		end




	end

	def add
   		@list = List.create(:description => params[:todo_text])
   		@list.save
   		redirect_to lists_path
	end

	def edit

	end

	def update
 		@list.update(list_params)
  		redirect_to lists_path
	end

	def destroy
		if @list.destroy
			redirect_to lists_path
		else 
			flash[:alert] = "Post unsuccessfully deleted"
			redirect_to lists_path
		end
	end

	def finish
		@list.dostate = "YES"
		@list.save
		redirect_to lists_path
	end

	def unfinish
		@list.dostate = "NO"
		@list.save
		redirect_to lists_path
	end

	def showfinish
	end


	private

	def list_params
		params.require(:list).permit(:description)
	end

	def find_list
		@list = List.find(params[:id]) 
	end

end
