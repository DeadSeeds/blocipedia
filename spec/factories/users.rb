FactoryBot.define do
  pw = RandomData.random_sentence

  factory :user do
    # name RandomData.random_name
    sequence(:email){ |n| "user#{n}@factory.com" }
    password pw
  end
end
