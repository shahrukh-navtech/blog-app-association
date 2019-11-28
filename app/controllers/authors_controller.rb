# Authors Controller
class AuthorsController < ApplicationController

	def index
		@authors = Author.all
	end

	def edit
		@author = Author.find(params[:id])
	end

	def new
	end

	def create
		p = params[:authors]
		@author = Author.create(first_name: p[:first_name], last_name: p[:last_name], phone: p[:phone])
		redirect_to authors_path
	end

	def update
		p = params
		@author = Author.find_by(id: p[:id])
		@author.first_name = p[:author][:first_name]
		@author.last_name = p[:author][:last_name]
		@author.phone = p[:author][:phone]
		@author.save
		redirect_to authors_path
	end

	def show
		@author = Author.find(params[:id])
	rescue StandardError => e
  	flash[:error] = e.message
  	redirect_to authors_path
	end

	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		redirect_to authors_path
	end

end
