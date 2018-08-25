FactoryBot.define do
  factory :comment do
    comment "Awesome"
    post {create(:post, user: user)}
    user_id {create (:user)}
  end
end