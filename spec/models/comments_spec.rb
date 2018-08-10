require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "validations" do
    describe "it is not present" do
      let(:comment) {build(:comment,comment:'')}
      it 'should be invalid' do
        expect(comment.valid?).to be_falsey
      end
    end

    describe "it does not have minimum 3 char" do
      let(:comment) {build(:comment,comment:'12')}
      it 'should be invalid' do
        expect(comment.valid?).to be_falsey
      end
    end
  end

  describe "It is under a post" do
    let(:comment) {build(:comment)}
    it "it belongs to a post " do
      expect(comment).to be_truthy
    end
  end


end

