module Api
  module V1
    class AuthorController < ApplicationController

      def index
        @id = params[:article_id]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Articles::AuthorWriter.new.find_author(@id).to_json))
      end

    end
  end
end
