class JoinsController < ApplicationController
  def create
  join = Join.new
  idea = Idea.find params[:idea_id]
  join.idea = idea
  # in here add if !(like.user_id == current user)
  # user_found = like.find_by_user_id(current_user)
  # if user_found.present? then dont save else save
  join.user = current_user

  if join.save
    redirect_to idea_path(idea), notice: "Joined!"
  else
    redirect_to idea_path(idea), notice: "Nothing happened!"
end
end

def destroy
  idea = Idea.find params[:idea_id]
  join = current_user.joins.find params[:id]
  join.destroy
  redirect_to idea_path(idea), notice: "Unjoined!"
end

end
