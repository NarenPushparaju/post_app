require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) {create(:user)}

  describe "validations" do
    describe "it is not present" do
      let(:comment) {build(:comment,comment:'', user: user)}
      it 'should be invalid' do
        expect(comment.valid?).to be_falsey
      end
    end

    describe "it does not have minimum 3 char" do
      let(:comment) {build(:comment,comment:'12', user: user)}
      it 'should be invalid' do
        expect(comment.valid?).to be_falsey
      end
    end
  end

  describe "It is under a post" do
    let(:comment) {build(:comment, user: user)}
    it "it belongs to a post " do
      expect(comment.post).to be_truthy
    end
  end
end