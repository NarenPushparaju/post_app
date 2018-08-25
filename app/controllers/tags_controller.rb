=begin
class TagsController < ApplicationController
  before_action :set_post


  def index
    @tag=@post.tags.all
  end

  def new
    @tag=@post.tags.new
  end

  def create
    @tag = @post.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag added Successfully"
      @part=PostTag.create(post_id: @post.id, tag_id: @tag.id)
      redirect_to topic_post_path(topic_id: @topic, id: @post.id)
    else
      render 'new'
    end
  end

  def show
      @tag=@posts.tags.all
  end

  def destroy
    @tag.destroy
    redirect_to posts_path
  end
private

def tag_params
  params.require(:tag).permit(:tag,:post_id)
end

def set_post
  @post = Post.find(params[:post_id])
  @topic = @post.topic_id
end
end=end
