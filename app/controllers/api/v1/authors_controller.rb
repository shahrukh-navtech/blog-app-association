module Api
  module V1
    class AuthorsController < ApplicationController

      def index
        render status: 200, json: Blogapp::Writers::Authors::AuthorsWriter.new.all()
      end

      def showcols
        @cols = params[:author]
        render status: 200, json: Blogapp::Writers::Authors::AuthorsWriter.new.single_col(@cols)
      end

      def show
        @id = params[:id]
        render status: 200, json: Blogapp::Writers::Authors::AuthorsWriter.new.single(@id)
      end


    end
  end
end
