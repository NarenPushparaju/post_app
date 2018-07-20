class PostsController < ApplicationController
  def index
    @post=Post.all
  end
  def new
    @post=Post.new
  end
  def show
    @show=Post.find(params[:id])
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
  @post = Post.find(params[:id])
  end
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice]="Updated Successfully"
        redirect_to post_path
      else
        render 'edit'
      end
  end
  def topic
    @topic=Post.where(topic_id: params[:id])
    @title=Topic.find(params[:id])
    if @title.blank?
      flash[:notice]="Posts Not Found"
    end
  end
end
private

def post_params
  params.require(:post).permit(:name,:hastag, :description,:topic_id)
end



