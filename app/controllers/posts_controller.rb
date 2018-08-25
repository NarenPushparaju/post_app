class PostsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  respond_to :html,:js, :json

  def index
    if @topic.present?
      @posts = @topic.posts.all
    else
      @posts = Post.includes(:topic)
    end
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)

    respond_to do |format|
      format.html
      format.js
      format.json { render :json=> @posts}
    end

  end

  def new
    @post=@topic.posts.new
    @post.user=current_user
    @post.tags.build
    @tag_all = Tag.all
  end

  def show
    if Rating.where(post_id: @post.id, user_id: current_user.id).blank?
      @rating = @post.ratings.build
    else
      @rating=Rating.where(post_id: @post.id,user_id: current_user)
    end

    # @user_id=current_user
    @comments = @post.comments.includes(:user)
    @tag = @post.tags
    @rate = @post.ratings.group("rate").count
    @post.ratings.average(:rate).to_s
    @rate = Hash[@rate.to_a.reverse]
    @read=ReadStatus.create(user_id: current_user.id,post_id: @post.id)
    respond_to do |format|
      format.html
      format.js
      format.json { render :json=> @post }
    end
  end

  def create
    @post = @topic.posts.new(post_params)
    @post.user=current_user
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post sent Successfully"
        format.html {redirect_to topic_post_path(id: @post.id)}
        format.js
    else
        format.html {render :new}
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  def edit
    authorize! :update ,@post

  end


  def destroy
    @post.destroy
    redirect_to topic_posts_path(@post.topic_id)
  end

  def update
    if @post.update(post_params)
      redirect_to topic_post_path(id: @post.id)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :description,tags_attributes: [:tag],tag_ids: [],ratings_attributes: [:id,:rate,:user_id])
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