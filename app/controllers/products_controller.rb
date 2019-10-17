class ProductsController < ApplicationController

	def index
		@products = Product.all

	end

	def new
		@categories = Category.all
		@product = Product.new


	end

	def create

		puts params[:products]

		@product = Product.create(name: params[:products][:name])

		@category = Category.find_by(id: params[:products][:category])

		@category.products << @product

		redirect_to products_path

	end

	def edit
		@product = Product.find(params[:id])
		@categories = Category.all

	end

	def update

		@product = Product.find_by(id: params[:id])

		@product.name = params[:product][:name]

		@product.save

		redirect_to products_path

	end

	def show

		@product = Product.find(params[:id])

		#puts @category.products

	end

	def destroy

		@product = Product.find(params[:id])

		@product.destroy

		redirect_to products_path

	end

end
