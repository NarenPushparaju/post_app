class PostsController < ApplicationController

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    if @topic.present?
      @posts = @topic.posts.all
    else
      @posts = Post.includes(:topic)
    end
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)

  end

  def new
    @post = @topic.posts.new
    @tag = @post.tags.new
    @tag_all = Tag.all
  end

  def show
    @comment = @post.comments
    @tag = @post.tags
    @rate = @post.ratings.group("rate").count
    @rate = Hash[@rate.to_a.reverse]
    @avg_rate = @post.ratings.average(:rate)
  end

  def create

    @post = @topic.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post sent Successfully"
      redirect_to topic_post_path(id: @post.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def rate
    @rate = Rating.new(rate: params[:rate], post_id: params[:post_id])
    if @rate.save
      redirect_to topic_post_path(topic_id: params[:topic_id], id: params[:post_id])
    end
  end

  def destroy
    @post.destroy
    redirect_to topic_posts_path(@post.topic_id)
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Updated Successfully"
      redirect_to topic_post_path(id: @post.id)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :description, tag_ids: [], tags_attributes: [:tag, :_destroy, :id])
  end

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def set_topic
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
    end
  end
end