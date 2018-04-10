FactoryBot.define do
  pw = RandomData.random_sentence

  factory :user do
    # name RandomData.random_name
    sequence(:email){ |n| "user#{n}@factory.com" }
    password pw
    role :standard
  end

  factory :admin, class: User do
    sequence(:email){ |n| "admin#{n}@factory.com" }
    password pw
    role :admin
  end

  # factory :premium do
  #   sequence(:email){ |n| "premium_user#{n}@factory.com" }
  #   password pw
  #   role :premium
  # end
end
