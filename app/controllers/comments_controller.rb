class CommentsController < ApplicationController
  before_action :set_post_comment
  before_action :set_comment, only: [:show, :edit, :destroy, :update]

  def index
    @comment = @post.comments.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added Successfully"
      redirect_to topic_post_path(topic_id: @topic, id: @post.id)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Updated Successfully"
      redirect_to topic_post_path(topic_id: @topic, id: @post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to topic_post_path(topic_id: @topic, id: @post.id)
  end
end

private

def comment_params
  params.require(:comment).permit(:comment, :post_id)
end
def set_comment
  @comment=@post.comments.find(params[:id])
end

def set_post_comment
  @post = Post.find(params[:post_id])
  @topic = @post.topic_id
end