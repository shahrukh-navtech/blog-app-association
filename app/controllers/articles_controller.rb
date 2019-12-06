# Articles Controller
class ArticlesController < ApplicationController
  # before_action :get_user, only: [:edit]
  before_action :authenticate_user!, only: [:edit, :destroy]

	def index
		@all_articles = Article.all
		# authorize @articles
		@articles = policy_scope(@all_articles)
		@cols = Article.column_names
	end

  def edit
    @article = Article.find(params[:id])
    authorize @article
    @authors = Author.all
  end

  def new
    puts 'Inside New Action of ArticlesController'
    @authors = Author.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      flash[:notice] = []
      @article.errors.full_messages.each { |msg| flash[:notice] << msg }
      redirect_to new_article_path
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    # @author = Author.find_by(id: params[:article][:author])
    # @article.title = params[:article][:title]
    # @article.author = @author
    # @article.body = params[:article][:body]
    # url_test(@article)
    # @article.save!
    @article.update(article_params)
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  # rescue StandardError => e
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Record Not found on id : #{params[:id]}"
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  def url_test(article)
    article.url = params[:article][:url] if params[:article][:url].present?
  end

  private

  def article_params
    params.require(:article).permit(:title, :author_id, :body, :url)
  end
end
