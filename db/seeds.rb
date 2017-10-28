User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

ing = Ingredient.create!(name: "Beet", description: 'The beetroot is the taproot portion of the beet plant,[1] usually known in North America as the beet, also table beet, garden beet, red beet, or golden beet. It is one of several of the cultivated varieties of Beta vulgaris grown for their edible taproots and their leaves (called beet greens). These varieties have been classified as B. vulgaris subsp. vulgaris Conditiva Group.')

5.times do
  ing.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street")
  ing.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.")  
end
