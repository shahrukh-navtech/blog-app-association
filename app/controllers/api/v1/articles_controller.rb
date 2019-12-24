module Api
  module V1
    class ArticlesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.all(), include: ['user']
      end

      def create
        # binding.pry
        # @cols = params[:article]
        # puts Blogapp::Writers::Articles::ArticlesWriter.new.create(article_params)
        if Blogapp::Writers::Articles::ArticlesWriter.new.create(article_params)
          render status: 200, json: '{"status" : "Updated"}'
        else
          render status: 403, json: '{"status" : "ERROR"}'
        end

        rescue ActionController::ParameterMissing
          render status: 403, json: '{"status" : "Enter Something"}'
      end

      def show
        @id = params[:id]
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single(@id), include: ['user','author']
      end

      def update
        binding.pry
        @article = Article.find_by(id: params[:id])
        if @article.update(article_params)
          render status: 200, json: '{"status" : "Updated"}'
        else
          render status: 403, json: '{"status" : "ERROR"}'
        end
      end

      def destroy
        @article = Article.find_by(id: params[:id])
        if @article.destroy
          render status: 200, json: '{"status" : "Destroyed Successfully"}'
        else
          render status: 403, json: '{"status" : "ERROR"}'
        end
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :url)
      end

    end
  end
end