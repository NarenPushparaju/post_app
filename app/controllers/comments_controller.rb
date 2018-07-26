class CommentsController < ApplicationController
  def index
    @comment=Comment.where(post_id: params[:post_id])
    @id=params[:post_id]
  end
  def new
    @post=Post.find(params[:post_id])
    @comment=Comment.new(post_id: params[:post_id])
    @comment.post_id
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice]="Comment added Successfully"
      redirect_to post_path(@comment.post_id)
    else
      render 'new'
    end
  end
  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post_id)
  end
end
private

def comment_params
  params.require(:comment).permit(:comment,:post_id)
end
