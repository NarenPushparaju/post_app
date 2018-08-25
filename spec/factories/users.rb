require 'faker'
FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password "Naren177"
  end
end