require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    it "must be unique regardless of the case" do
      create(:tag,tag:"hello")
      tag = build(:tag,tag:"Cinema")
      expect(tag.valid?).to be_truthy
    end
  end
end