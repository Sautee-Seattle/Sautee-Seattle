FactoryBot.define do
  factory :post do
    type 'recipe'
    title 'Wenis'
    body 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to'

    factory :post_with_ingredients do
      transient do
        ingredient_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:ingredient, evaluator.ingredient_count, posts: [post])
      end
    end
  end
end
