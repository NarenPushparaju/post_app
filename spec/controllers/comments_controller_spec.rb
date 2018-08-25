require 'rails_helper'


RSpec.describe CommentsController, type: :controller do


  let(:user) {create(:user)}
  before(:each) do
    sign_in(user)
  end
  describe "POST #create" do

    let(:comment_post) {create(:post, user: user)}
    context "on valid creation" do

      before do

        comment_atr = attributes_for(:comment,post:comment_post)
        post :create, params: {comment:comment_atr,post_id:comment_post.id,topic_id:comment_post.topic.id}
      end

      it "makes a new entry in the db" do
        expect(Comment.count).to eq 1
      end
    end

    context "on invalid creation" do

      it "does not make any changes in the db" do
        expect(Comment.count).to eq 0
      end
    end
  end
end