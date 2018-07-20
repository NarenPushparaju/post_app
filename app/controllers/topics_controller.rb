class TopicsController < ApplicationController
  def index
    @topics=Topic.all
  end
  def new
    @topic=Topic.new
  end
  def show
    @show=Topic.find(params[:id])
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
    @topic = topic.find(params[:id])
  end
  def destroy
    @topic=topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end
  def update
    @topic = topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:notice]="Updated Successfully"
      redirect_to topic_path
    else
      render 'edit'
    end
  end
end
private

def topic_params
  params.require(:topic).permit(:topic)
end



