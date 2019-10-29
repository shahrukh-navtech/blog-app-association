module Api
  module V1
    class ArticleController < ApplicationController

      def index
        @id = params[:author_id]
        render status: 200, json: Blogapp::Writers::Authors::ArticleWriter.new.find_article(@id)

        # @articles = Article.all
        # render status: 200, json: @articles, location: articles_path
      end

      # def showcols
      #   @cols = params[:article]
      #   # render status:200, json: "#{Article.pluck @cols}"
      #   render status: 200, json: Blogapp::Writers::Articles::AuthorsWriter.new.single_col(@cols)
      # end

      # def show
      #   #@article = Article.find(params[:id])
      #   @id = params[:id]
      #   render status: 200, json: Blogapp::Writers::Articles::AuthorsWriter.new.single(@id)
      # end


    end
  end
end
