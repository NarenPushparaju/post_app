class PostsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_topic, except: :dateFilter
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :read_status, only: [:show]

  def index
    if @topic.present?
      @posts = @topic.posts.all
    else
      @posts = Post.includes(:topic)

    end
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)

  end

  def new
    @post=@topic.posts.new
    @post.tags.build
    @tag_all = Tag.all
  end

  def show

    @rating=Rating.where(post_id: @post.id,user_id: current_user).first_or_initialize
    @comments = @post.comments.includes(:user)
    @tag = @post.tags
    @rate=@post.ratings

  end

  def dateFilter
    if params[:start_date].present?
      start_date= params[:start_date].to_date.beginning_of_day
      end_date=params[:end_date].to_date.end_of_day
    else
      start_date=Date.yesterday.beginning_of_day
      end_date=Date.today.end_of_day
    end
    @posts=Post.where(created_at: start_date..end_date).includes(:topic)
  end

  def create
    @post = @topic.posts.new(post_params)
    @post.user=current_user
    respond_to do |format|
      if @post.save
        # flash[:notice] = "Post sent Successfully"
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
  def read_status
    @read=ReadStatus.create(user_id: current_user.id,post_id: @post.id)
  end
end