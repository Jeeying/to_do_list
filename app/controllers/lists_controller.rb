class ListsController < ApplicationController
	before_action :set_list, :only => [:show,:edit,:update,:destroy,:finished]

	def index
		@lists=List.all
	end

	def new
		@list=List.new
	end

	def create
		@list=List.new(list_params)
		
		if @list.save
			redirect_to lists_url
		else
			render :action => :new
		end
	end

	def update
		if @list.update_attributes(list_params)
			redirect_to list_path(@list)
		else
			render :action => :edit
		end
		
	end

	def finished
		if @list.finished == false
			@list.finished = true
		else
			@list.finished = false
		end

		@list.save
		redirect_to lists_url

	end

	def destroy
		if @list.due_date < current
			redirect_to lists_url, alert: "This item can not to delete. Because is over due date."
		else
		@list.destroy
		redirect_to lists_url
		end		

	end

	def deleteall
		@list=List.delete_all
		redirect_to lists_url

	end

	private

	def set_list
		@list=List.find(params[:id])
	end
	def list_params
		params.require(:list).permit(:list_name,:due_date,:description,:finished)
	end

	def current
  		::Time.zone ? ::Time.zone.now : ::Time.now
	end

end
