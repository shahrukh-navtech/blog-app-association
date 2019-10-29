module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        @articles = Article.all
        render status: 200, json: @articles, location: articles_path
      end

      def showcols
        @cols = params[:article]
        # render status:200, json: "#{Article.pluck @cols}"
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single_col(@cols)
      end

      def show
        #@article = Article.find(params[:id])
        @id = params[:id]
        #render status: 200, json: @article
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single(@id)
      end


    end
  end
end
