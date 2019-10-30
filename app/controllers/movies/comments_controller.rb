class Movies::CommentsController < CommentsController
  before_action :set_commentable

  def index
  	@movie = Movie.find(params[:movie_id])

  end

  private
    def set_commentable
      @commentable = Movie.find(params[:movie_id])
    end

end
