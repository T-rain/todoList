class ListsController < ApplicationController
	before_action :find_list,:only =>[:update,:edit,:destroy]

	def index
		@list = List.all
		@todo = List.new
	end

	def add
   		List.create(:description => params[:todo_text])
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

	private

	def list_params
		params.require(:list).permit(:description)
	end

	def find_list
		@list = List.find(params[:id]) 
	end

end
