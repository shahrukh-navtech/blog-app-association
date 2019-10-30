class MagazinesController < ApplicationController

	def index
		@magazines = Magazine.all
	end

	def new
	end

	def create
		@magazine = Magazine.create(name: params[:magazines][:name])
		redirect_to magazines_path
	end

	def edit
		@magazine = Magazine.find(params[:id])
	end

	def update
		@magazine = Magazine.find_by(id: params[:id])
		@magazine.name = params[:magazine][:name]
		@magazine.save
		redirect_to magazines_path
	end

	def show
		@magazine = Magazine.find(params[:id])
	end

	def destroy
		@magazine = Magazine.find(params[:id])
		@magazine.destroy
		redirect_to magazines_path
	end

end
