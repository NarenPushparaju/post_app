require 'spec_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @topic=Topic.new(topic:"TN")
    @post=Post.new(name: "naren", description: "hello",topic_id: @topic).save
  end
  it 'ensures title presence' do
    expect(@post).to eq(true)
  end
  it 'ensures titile presence' do
    expect(@post).to eq(false)
  end
end