class CategoriesController < ApplicationController

	def index
		@categories = Category.all

	end

	def new
	end

	def create
		@category = Category.create(name: params[:categories][:name])

		redirect_to categories_path

	end

	def edit
		@category = Category.find(params[:id])

	end

	def update

		@category = Category.find_by(id: params[:id])

		@category.name = params[:category][:name]

		@category.save

		redirect_to categories_path

	end

	def show

		@category = Category.find(params[:id])

		#puts @category.products

	end

	def destroy

		@category = Category.find(params[:id])

		@category.destroy

		redirect_to categories_path

	end

end
