class LikesController < ApplicationController

  def create
  like = Like.new
  idea = Idea.find params[:idea_id]
  like.idea = idea
  # in here add if !(like.user_id == current user)
  # user_found = like.find_by_user_id(current_user)
  # if user_found.present? then dont save else save
  like.user = current_user

  if like.save
    redirect_to idea_path(idea), notice: "Liked!"
  else
    redirect_to idea_path(idea), notice: "Nothing happened!"
end
end

def destroy
  idea = Idea.find params[:idea_id]
  like = current_user.likes.find params[:id]
  like.destroy
  redirect_to idea_path(idea), notice: "Unliked!"
end

end
