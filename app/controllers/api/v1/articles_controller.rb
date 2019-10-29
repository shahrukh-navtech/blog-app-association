module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.all()
      end

      def create
        @cols = params[:article]
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single_col(@cols)
      end

      def show
        @id = params[:id]
        render status: 200, json: Blogapp::Writers::Articles::ArticlesWriter.new.single(@id)
      end


    end
  end
end
