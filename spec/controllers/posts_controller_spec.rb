require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    end
    describe "Get#new " do
      let (:topic) {create(:topic)}
      context "New Post " do
        it "return success and has a instance of Post" do
          get :new, params:{topic_id: topic.id}
          expect(response).to have_http_status(200)
          expect(assigns[:post]).to be_a_new(Post)
        end
      end
    end
  describe "GET#edit" do
    context "edits and existing post" do
      let(:post) {create(:post)}
      before do
        get :edit, params: {id: post.id,topic_id: post.topic.id}
      end

      it "renders edit page" do
        expect(response).to render_template(:edit)
      end

      it "responds with status 200" do
        expect(response).to have_http_status 200
      end
    end
  end
  describe "Post#create" do

    context "on invalid post" do
      let(:topic) {create(:topic)}
      it "should not create a new post on db" do
        expect {
          post :create,params: {post: attributes_for(:post,title:'sd'),topic_id: topic}
        }.to change(Post,:count).by(0)
      end
      it "should render to the same page" do
        post :create, params: {post: attributes_for(:topic,title:''),topic_id: topic}
        expect(response).to render_template(:new)
      end
    end
    context "on valid post" do
      let(:topic){create(:topic)}
      it "should create a new post on db" do
        expect {
          post :create,params: {post: attributes_for(:post),topic_id: topic}
        }.to change(Post,:count).by(1)
      end
      it "should redirect to the other page" do
        post :create, params: {post: attributes_for(:post),topic_id: topic}
        expect(response).to have_http_status 302
      end
    end
  end
  describe 'Post # update' do
      let(:topic) {create(:topic)}
      let(:post) {create(:post, topic: topic)}
      context 'valid edit' do
        before do
          post_attr = attributes_for(:post)
          put :update, params:{id:post.id,post: post_attr ,topic_id: post.topic.id}
        end

        it "responds with redirect status" do
          expect(response).to have_http_status 302
        end

        it "changes entries in the database" do
          expect(post.title).to_not eq Post.find(post.id).title
        end
      end
  end
  describe "Post # Delete" do
    context "deleting an existing post" do

      let(:post) {create(:post)}
      before do
        delete :destroy , params:{id:post.id,topic_id: 1}
      end

      it 'should return redirect to root' do
        expect(response).to have_http_status 302
      end
      it 'should should remove entry from DB' do
        expect(Post.find_by(id:post.id)).to be_falsey
      end

    end

  end
  end