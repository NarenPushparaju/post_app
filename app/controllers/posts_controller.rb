class PostsController < ApplicationController

  before_action :set_post, only: [:show,:edit,:destroy,:update]

  def index
    if Topic.exists?(params[:topic_id])
      @post=Post.where(topic_id: params[:topic_id])
      @title=Topic.find(params[:topic_id])
      @tag=Tag.where(post_id: params[:post_id])
    else
      redirect_to posts_path
    end
  end
  def new
    @topic=Topic.find(params[:topic_id])
    @posts=Post.new(topic_id: params[:topic_id])
    @posts.tags.build
    @posts.comments.build
    @tag=Tag.all
  end
  def show
    @comment=Comment.where(post_id: params[:id])
    @post.comments.build
    @post=Post.find(params[:id])
    @topic=Topic.find(@post.topic_id)
    @tags=@post.tags
  end
  def create
    @post = Post.new(post_params)
    taa =params[:tag_id]
    puts taa
    if @post.save
      flash[:notice]="Post sent Successfully"
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end
  def edit
  end
  def posts
    @posts=Post.all
  end
  def destroy
    @post.destroy
    redirect_to topic_posts_path(@post.topic_id)
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
  end
end
private

def post_params
  params.require(:post).permit(:name,:hastag,:description,:topic_id,tag_ids:[],comments_attributes: [:comment],tags_attributes: [:tag])
end

def set_post
  @post=Post.find(params[:id])
end



