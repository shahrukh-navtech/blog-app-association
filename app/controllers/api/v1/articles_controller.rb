class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render status: 200, json: @articles, location: articles_path
  end

  def showcols
    @cols = params[:article]
    render status:200, json: "#{Article.pluck @cols}"
  end

  def show
    @article = Article.find(params[:id])
    #binding.pry
    render status:200, json: @article
  end


end