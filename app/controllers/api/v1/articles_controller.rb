module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::ArticlesWriter.new.all().to_json))
      end

      def create
        @cols = params[:article]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::ArticlesWriter.new.single_col(@cols).to_json))
      end

      def show
        @id = params[:id]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::ArticlesWriter.new.single(@id).to_json))
      end


    end
  end
end
