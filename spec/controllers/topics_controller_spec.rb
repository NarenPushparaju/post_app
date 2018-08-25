require 'rails_helper'
RSpec.describe TopicsController, type: :controller do
  before(:each) do
    sign_in(create(:user))
  end
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "check for assign" do
      get :index
      topics_count = Topic.all
      expect(assigns[:topics]).to eq(topics_count)
    end
  end
  describe "Get#new " do
      it "return success and has a instance of topic" do
        get :new
        expect(response).to have_http_status(200)
        expect(assigns[:topic]).to be_a_new(Topic)
      end
  end
  describe "GET #edit" do
    context "edits and existing topic" do
      let(:topic){create(:topic)}
      it "renders edit page" do
        get :edit, params: {id: topic.id}
        expect(response).to render_template(:edit)
      end
    end
  end
  describe "Topic #create" do
    context "for valid topic" do
      it "should create new Topic and renders index" do
        expect { post :create,params:{ topic:{topic: "Tech"} }
        }.to change(Topic,:count).by(1)
        expect(response).to redirect_to(topics_path)

      end
    end

    context "on invalid topic" do
      it "should not create a new topic on db" do
        expect {
          post :create,params: { topic:{topic: ""}}
        }.to change(Topic,:count).by(0)
      end
      it "should render to the same page" do
        post :create, params: {topic:{topic:"fd"}}
        expect(response).to render_template(:new)
      end
    end
  end
  describe "Topic #Update" do
    let(:topic){create(:topic)}
    context "on valid update"  do
      before do
        put :update, params: topic_post_params(topic)
      end

      it "changes the content on the db" do
        topic_in_db = Topic.find(topic.id)
        expect(topic_in_db.topic).to eq("Entertainment")
      end
    end

    context "on invalid update" do
      before do
        topic.topic = ""
        put :update, params: topic_post_params(topic)
      end

      it "renders new page" do
        expect(response).to render_template(:edit)
      end

      it "does not change db" do
        topic_in_db = Topic.find(topic.id)
        expect(topic_in_db.topic).to_not eq("")
      end
    end
  end
  end
def topic_post_params(topic=nil,valid=true)
  if !topic && valid
    topic = Topic.create(topic:'Entertainment')
  elsif !topic && !valid
    topic = Topic.new(topic:'')
  end
  {id:topic.id,topic:{id: topic.id, topic:topic.topic}}
end