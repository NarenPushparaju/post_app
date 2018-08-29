require 'faker'
FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password "Naren@177"
  end
end