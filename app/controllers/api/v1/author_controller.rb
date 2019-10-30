module Api
  module V1
    class AuthorController < ApplicationController

      def index
        @id = params[:article_id]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::AuthorWriter.new.find_author(@id).to_json))

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
