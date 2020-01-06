module Api
  module V1
    # Article Controller
    class ArticleController < ApplicationController
      def index
        @id = params[:author_id]
        render status: 200, json: JSON.pretty_generate(JSON.parse(Blogapp::Writers::Authors::ArticleWriter.new.find_article(@id).to_json))
      end
    end
  end
end
