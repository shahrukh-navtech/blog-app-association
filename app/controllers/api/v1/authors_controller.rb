module Api
  module V1
    class AuthorsController < ApplicationController

      def index
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Authors::AuthorsWriter.new.all().to_json))
      end

      def showcols
        @cols = params[:author]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Authors::AuthorsWriter.new.single_col(@cols).to_json))
      end

      def show
        @id = params[:id]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Authors::AuthorsWriter.new.single(@id).to_json))
      end


    end
  end
end
