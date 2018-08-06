require 'rails_helper'

RSpec.describe Topic, type: :model do
  before(:each) do
    @topic=Topic.new(topic: "Agfhgfhdg")
    end

  it "is valid with valid attributes" do
      expect(@topic).to be_valid
  end

  it "is not valid without title" do
    @topic.topic=""
    expect(@topic).to_not be_valid
  end
  it "enter minimum three character" do
    @topic.topic = "er"
    expect(@topic).to_not be_valid
  end
end