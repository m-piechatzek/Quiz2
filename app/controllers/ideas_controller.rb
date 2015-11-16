class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @idea = Idea.all
    @user = User.new
    @join = Join.new
    @like = Like.new
  # @ideas = Idea.find params[:id]


  end

  def new
    @idea = Idea.new
  end

  def create
    idea_params = params.require(:idea).permit([:title, :body])
    @idea = Idea.new(idea_params)

      @idea.user = current_user
    if @idea.save
      redirect_to(ideas_path)
    else
      render :new
    end
  end

  def show
      @ideas = Idea.all
  @idea = Idea.find params[:id]
  # @comment = @idea.comment
    # @comments = @idea.comments.order("created_at DESC")
      @comment = Comment.new
          @like = @idea.like_for(current_user)
          @join = @idea.join_for(current_user)

  end

end
