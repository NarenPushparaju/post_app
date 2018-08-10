require 'rails_helper'

RSpec.describe Post, type: :model do

  describe Post do
    it "present" do
      post = build(:post,title:'')
      expect(post.valid?).to be_falsey
    end
    it "minimum 3 char long" do
      post = build(:post,title:'23')
      expect(post.valid?).to be_falsey
    end
    it "is invalid without a title" do
      post1 = Post.new(title: nil)
      post1.valid?
      expect(post1.errors[:title]).to include("can't be blank")
    end
    describe "The body should be" do
      it "present" do
        post = build(:post,description:'')
        expect(post.valid?).to be_falsey
      end

    end
  end

  describe Post do
    it 'Post has many comments' do
      assc=Post.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end
  describe Post do
    it "Post have many ratings" do
      assc=Post.reflect_on_association(:ratings)
      expect(assc.macro).to eq :has_many
    end
  end
end
