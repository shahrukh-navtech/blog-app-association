class Actors::CommentsController < CommentsController
  before_action :set_commentable

  def index
  	@actor = Actor.find(params[:actor_id])

  end

  private
    def set_commentable
      @commentable = Actor.find(params[:actor_id])
    end
end