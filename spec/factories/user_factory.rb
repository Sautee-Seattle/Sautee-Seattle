FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Jordan#{n}"}
    sequence(:email) {|n| "anil#{n}@jerod.com"}
    password 'password'
    bio 'hams...nuff said.'

    factory :user_with_recipes_and_locations do
      transient do
        post_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.post_count, user: user)
      end
    end
  end
end
