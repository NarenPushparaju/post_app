class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :destroy, :update]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Updated Successfully"
      redirect_to topic_path
    else
      render 'edit'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:topic)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end