module Api
  module V1

    class ArticlesController < ApplicationController

      def index
        @articles = Article.all
        render status: 200, json: @articles, location: articles_path
        binding.pry
      end

      def showcols
        @cols = params[:article]
        #binding.pry
        # render status:200, json: "#{Article.pluck @cols}"
        render status: 200, json: Blogapp::Writers::Articles::ArticleWriter.new.single(@cols)
      end

      def show
        @article = Article.find(params[:id])
        #binding.pry
        render status: 200, json: @article
      end


    end
  end
end
