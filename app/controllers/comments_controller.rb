class CommentsController < ApplicationController

    before_action :authenticate_user!

  def create
  @idea = Idea.find params[:idea_id]
  comment_params = params.require(:comment).permit(:body)

  @comment = Comment.new(comment_params)
  @comment.idea = @idea
  @comment.user_id = session[:user_id]

  if @comment.save
    redirect_to idea_path(@idea), notice: "Created Comment!"
  else
    render idea_path
  end
end

# def show
#   @idea = Idea.find params[:id]
#   @idea.comments.order("created_at DESC")
# end

def destroy
  @comment = Comment.find params[:id]
  @comment.destroy

  redirect_to idea_comment_path
end
end
