require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post=Post.new(title: "naren", description: "hello",topic_id: 1)
  end
  it 'ensures presence' do
    expect(@post).to be_valid
  end
  it 'ensures title presence' do
    @post.title=""
    expect(@post).to_not be_valid
  end
  it 'ensures description presence' do
    @post.description=""
    expect(@post).to be_valid
  end
end