FactoryBot.define do
  factory :ingredient do
    name 'covfefe'

    factory :ingredient_with_recipes do
      transient do
        posts_count 5
      end

      after(:create) do |ingredient, evaluator|
        create_list(:post, evaluator.posts_count, ingredients: [ingredient], post_type: 'recipe')
      end
    end

    factory :ingredient_with_recipes_and_locations do
      transient do
        posts_count 5
      end

      after(:create) do |ingredient, evaluator|
        create_list(:post, evaluator.posts_count, ingredients: [ingredient], post_type: "location")
        create_list(:post, evaluator.posts_count, ingredients: [ingredient], post_type: "recipe")
      end
    end
  end
end
