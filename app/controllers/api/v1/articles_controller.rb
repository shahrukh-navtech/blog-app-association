module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.all(), include: ['user','author']
      end

      def create
        @cols = params[:article]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::ArticlesWriter.new.single_col(@cols).to_json))
      end

      def show
        @id = params[:id]
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single(@id), include: ['user','author']
      end

      def update

        # binding.pry

        @article = Article.find_by(id: params[:id])
        if @article.update(article_params)
          render status: 200, json: '{"status" : "Updated"}'
        else
          render status: 403, json: '{"status" : "ERROR"}'
        end
      end


      private

      def article_params
        params.require(:article).permit(:title, :author_id, :body, :url)
      end

    end
  end
end