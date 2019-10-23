class CommentsController < ApplicationController
  def create
    #binding.pry
    @comment = @commentable.comments.new comment_params
    @comment.save
    redirect_to @commentable, notice: "Your Comment Successfully posted"
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
