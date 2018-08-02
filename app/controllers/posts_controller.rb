class PostsController < ApplicationController

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index

    if @topic.present?
      @posts = @topic.posts.includes(:comments)
    else
      @posts = Post.includes(:comments)
    end

    @posts = @posts.paginate(:page => params[:page], :per_page => 3)

  end

  def new
    @post = Post.new
    @tag = Tag.all
  end

  def show
    @comment = Comment.where(post_id: params[:id]).paginate(:page => params[:page], :per_page => 10)
    @post.comments.build
    @rate = Rating.where(post_id: @post.id).group("rate").count
    @rate = Hash[@rate.to_a.reverse]
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post sent Successfully"
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def rate
    @rate = Rating.new(rate: params[:rate], post_id: params[:postid])
    if @rate.save
      redirect_to post_path(params[:postid])
    end
  end

  def posts
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    @post.destroy
    redirect_to topic_posts_path(@post.topic_id)
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Updated Successfully"
      redirect_to post_path
    else
      render 'edit'
    end
  end

end

private

def post_params
  params.require(:post).permit(:name, :hastag, :description, :topic_id, tag_ids: [], comments_attributes: [:comment], tags_attributes: [:tag])
end

def set_post
  @post = @topic.posts.find(params[:id])
end

def set_topic
  @topic = Topic.find(params[:topic_id])
end