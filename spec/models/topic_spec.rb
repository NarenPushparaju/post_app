require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe "validations" do
    it "requires topic name" do
      topic = build(:topic,topic: "" )
      expect(topic.valid?).to be_falsey
    end

    it "requires topic name to have minimum length" do
      topic = build(:topic,topic:'he')
      expect(topic.valid?).to be_falsey
    end
  end
end
