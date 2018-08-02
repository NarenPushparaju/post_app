require 'spec_helper'

RSpec.describe Post, type: :model do
  context 'validation test ' do
    it 'ensures title presence' do
      topic=Topic.new(topic: "dd").save
      expect(topic).to eql(true)
    end
  end
end