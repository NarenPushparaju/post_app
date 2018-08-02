require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  context 'get#index' do
    it 'returns success response' do
      get :index
      expect(response).to be_success
    end
  end
  context 'get#new' do
    it 'returns success for new' do
      get :new
      expect(response).to be_success
    end
  end
  context 'get#show' do
    it 'returns success for show' do
      topic=Topic.create(topic: "skjfksdfg")
      get :show, params:{id: topic}
      expect(response).to be_success
    end
  end
end