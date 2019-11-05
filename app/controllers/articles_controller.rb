class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :destroy]

	def index
		@articles = Article.all
		@cols = Article.column_names
	end

	def edit
		@article = Article.find(params[:id])
		@authors = Author.all
	end

	def new
		puts "Inside New Action of ArticlesController"
		@authors = Author.all
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path
		else
			flash[:notice] = []
			@article.errors.full_messages.each do |msg|
				flash[:notice] << msg
			end
			redirect_to new_article_path
		end
	end

	def update
		@article = Article.find_by(id: params[:id])
		@author = Author.find_by(id: params[:article][:author])
		@article.title = params[:article][:title]
		@article.author = @author
		@article.body = params[:article][:body]
		@article.url = params[:article][:url]
		@article.save
		redirect_to articles_path
	end

	def show
		@article = Article.find(params[:id])
	#rescue ActiveRecord::RecordNotFound
	rescue StandardError => e
  	binding.pry
  	flash[:error] = "Record Not found on id : #{params[:id]}"
  	redirect_to articles_path
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:articles).permit(:title, :author_id, :body, :url)
		end
	
end
