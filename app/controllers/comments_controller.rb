class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :destroy, :update]

  def index
    @comments = @post.comments.all
  end

  def new
    @comment = @post.comments.new
    @comment.user = current_user
    respond_to do |f|
      f.html
      f.js
    end

  end

  def create
    @comments=@post.comments.all
    @comment = @post.comments.new(comment_params)
    @comment.name = current_user.name
    @comment.user = current_user
    if @comment.save
      # flash[:notice] = "Comment added Successfully"
      respond_to do |format|
        format.html {redirect_to topic_post_path(topic_id: @topic, id: @post.id)}
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @comments=@post.comments.all
    if @comment.update(comment_params)
      # flash[:notice] = "Comment edited Successfully"
      respond_to do |format|
        format.html {redirect_to topic_post_path(topic_id: @topic, id: @post.id)}
        format.js
      else
        format.html {render :new}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
    format.html {redirect_to topic_post_path(topic_id: @topic, id: @post.id)}
      format.js
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
    @topic = @post.topic_id
  end
end