FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Jordan#{n}"}
    sequence(:email) {|n| "anil#{n}@jerod.com"}
    password 'password'
    bio 'hams...nuff said.'
  end
end
