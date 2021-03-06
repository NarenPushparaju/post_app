FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "my title - #{n}"}
    description  {"n"*100}
    topic_id {create(:topic).id}
    user_id {create (:user)}

  end
end