FactoryBot.define do
  factory :ingredient do
    name 'covfefe'
    description 'The mighty and terrible god of internet typos. The mysterious and all-knowing overlord of the Twitter trolls, and Pepe is his prophet. On this the 30th day of May, he was summoned by the orange king to begin his reign of terror over the lawless wasteland of cyberspace. And it shall be that no blogger, no profile, no Twitter egg shall know peace in the hereafter until they have bowed in reverence and fear at the glorious might of Covfefe.'

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
