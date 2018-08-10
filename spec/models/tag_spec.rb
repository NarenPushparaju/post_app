require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    it "requires a tagname" do
      tag = build(:tag,tag: "" )
      expect(tag.valid?).to be_falsey
    end
    it "must be unique regardless of the case" do
      create(:tag,tag:"hello")
      tag = build(:tag,tag:"Ho")
      expect(tag.valid?).to be_falsey
    end
  end
end