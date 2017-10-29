FactoryBot.define do
  factory :post do
    sequence(:title) {|n| "Wenis#{n}"}
    post_type 'recipe'
    body 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to'
    user

    factory :post_with_ingredients do
      transient do
        ingredient_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:ingredient, evaluator.ingredient_count, posts: [post])
      end

      factory :location_with_ingredients do
        post_type 'location'
      end

      factory :recipe_with_ingredients do
        post_type 'recipe'
      end
    end
  end
end
