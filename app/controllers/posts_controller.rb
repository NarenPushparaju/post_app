class PostsController < ApplicationController

  before_action :set_post, only: [:show,:edit,:destroy,:update]

  def index
    @post=Post.all
  end
  def new
    @post=Post.new
    @post.comments.build
  end
  def show
    @comment=Comment.where(post_id: params[:id])
    @post.comments.build
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]="Post sent Successfully"
      redirect_to posts_path
    else
      render 'new'
    end
  end
  def edit
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  def update
      if @post.update(post_params)
        flash[:notice]="Updated Successfully"
        redirect_to post_path
      else
        render 'edit'
      end
  end
  def topic
    if Topic.exists?(params[:id])
      @topic=Post.where(topic_id: params[:id])
      @title=Topic.find(params[:id])
    else
      redirect_to posts_path
    end
  end
end
private

def post_params
  params.require(:post).permit(:name,:hastag, :description,:topic_id,comments_attributes: [:comment])
end

def set_post
  @post=Post.find(params[:id])
end



