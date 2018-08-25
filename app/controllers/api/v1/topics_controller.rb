class Api::V1::TopicsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_topic, only: [:show, :update, :destroy]
  protect_from_forgery with: :null_session,
                       if: Proc.new { |c| c.request.format =~ %r{application/json} }


  def index
    @topics = Topic.all
    render json: @topics.as_json(only: [:created_at,:topic])
  end

  def show
    render json: @topic
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      render json: @topic, status: :created, location: api_v1_topic_url(@topic)
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
  end


  private


  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:topic)
  end
end