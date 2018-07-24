class CommentsController < ApplicationController
  def new
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
end
private

def comment_params
  params.require(:comment).permit(:comment,:post_id)
end
